{-# LANGUAGE CPP, DeriveGeneric, DeriveFunctor, GeneralizedNewtypeDeriving,
             NamedFieldPuns, BangPatterns, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

-- | An abstraction to help with re-running actions when files or other
-- input values they depend on have changed.
--
module Rebuild.FileMonitor (

  -- * Declaring files to monitor
  MonitorFilePath(..),
  MonitorKindFile(..),
  MonitorKindDir(..),
  FilePathGlob(..),
  monitorFile,
  monitorFileHashed,
  monitorNonExistentFile,
  monitorFileExistence,
  monitorDirectory,
  monitorNonExistentDirectory,
  monitorDirectoryExistence,
  monitorFileOrDirectory,
  monitorFileGlob,
  monitorFileGlobExistence,
  monitorFileSearchPath,
  monitorFileHashedSearchPath,

  -- * Creating and checking sets of monitored files
  FileMonitor(..),
  newFileMonitor,
  MonitorChanged(..),
  MonitorChangedReason(..),
  checkFileMonitorChanged,
  updateFileMonitor,
  MonitorTimestamp,
  beginUpdateFileMonitor,

  FilePathRoot(..),
  FilePathGlobRel(..),
  GlobPiece(..),
  matchFileGlob
  ) where

#if MIN_VERSION_containers(0,5,0)
import qualified Data.Map.Strict as Map
#else
import qualified Data.Map        as Map
#endif
import qualified Data.ByteString.Lazy as BS
import qualified Data.Hashable as Hashable

import           Control.Monad
import           Control.Monad.Trans (MonadIO, liftIO)
import           Control.Monad.State (StateT, mapStateT)
import qualified Control.Monad.State as State
import           Control.Monad.Except (ExceptT, runExceptT, withExceptT,
                                       throwError)
import           Control.Exception

import           System.FilePath
import           System.Directory
import           System.IO

import qualified Control.Exception as Exception

import Data.Binary
import Data.List (sort, stripPrefix)
import GHC.Generics
import Data.Map (Map)
import Data.ByteString.Lazy (ByteString)

import Data.Time.Clock.POSIX ( POSIXTime, getPOSIXTime )
#if MIN_VERSION_directory(1,2,0)
-- import Data.Time.Clock.POSIX ( posixDayLength )
#else
import System.Time ( getClockTime, diffClockTimes
                   , normalizeTimeDiff, tdDay, tdHour )
#endif

import System.Posix.Files ( FileStatus, getFileStatus )

#if MIN_VERSION_unix(2,6,0)
import System.Posix.Files ( modificationTimeHiRes )
#else
import System.Posix.Files ( modificationTime )
#endif

-- import System.IO.Temp ( createTempDirectory )
import System.IO.Error ( isDoesNotExistError )

-- import qualified Text.ParserCombinators.ReadP as Parse

------------------------------------------------------------------------------
-- Types for specifying files to monitor
--


-- | A description of a file (or set of files) to monitor for changes.
--
-- Where file paths are relative they are relative to a common directory
-- (e.g. project root), not necessarily the process current directory.
--
data MonitorFilePath =
     MonitorFile {
       monitorKindFile :: !MonitorKindFile,
       monitorKindDir  :: !MonitorKindDir,
       monitorPath     :: !FilePath
     }
   | MonitorFileGlob {
       monitorKindFile :: !MonitorKindFile,
       monitorKindDir  :: !MonitorKindDir,
       monitorPathGlob :: !FilePathGlob
     }
  deriving (Eq, Show, Generic)

data MonitorKindFile = FileExists
                     | FileModTime
                     | FileHashed
                     | FileNotExists
  deriving (Eq, Show, Generic)

data MonitorKindDir  = DirExists
                     | DirModTime
                     | DirNotExists
  deriving (Eq, Show, Generic)

instance Binary MonitorFilePath
instance Binary MonitorKindFile
instance Binary MonitorKindDir

-- | Monitor a single file for changes, based on its modification time.
-- The monitored file is considered to have changed if it no longer
-- exists or if its modification time has changed.
--
monitorFile :: FilePath -> MonitorFilePath
monitorFile = MonitorFile FileModTime DirNotExists

-- | Monitor a single file for changes, based on its modification time
-- and content hash. The monitored file is considered to have changed if
-- it no longer exists or if its modification time and content hash have
-- changed.
--
monitorFileHashed :: FilePath -> MonitorFilePath
monitorFileHashed = MonitorFile FileHashed DirNotExists

-- | Monitor a single non-existent file for changes. The monitored file
-- is considered to have changed if it exists.
--
monitorNonExistentFile :: FilePath -> MonitorFilePath
monitorNonExistentFile = MonitorFile FileNotExists DirNotExists

-- | Monitor a single file for existence only. The monitored file is
-- considered to have changed if it no longer exists.
--
monitorFileExistence :: FilePath -> MonitorFilePath
monitorFileExistence = MonitorFile FileExists DirNotExists

-- | Monitor a single directory for changes, based on its modification
-- time. The monitored directory is considered to have changed if it no
-- longer exists or if its modification time has changed.
--
monitorDirectory :: FilePath -> MonitorFilePath
monitorDirectory = MonitorFile FileNotExists DirModTime

-- | Monitor a single non-existent directory for changes.  The monitored
-- directory is considered to have changed if it exists.
--
monitorNonExistentDirectory :: FilePath -> MonitorFilePath
-- Just an alias for monitorNonExistentFile, since you can't
-- tell the difference between a non-existent directory and
-- a non-existent file :)
monitorNonExistentDirectory = monitorNonExistentFile

-- | Monitor a single directory for existence. The monitored directory is
-- considered to have changed only if it no longer exists.
--
monitorDirectoryExistence :: FilePath -> MonitorFilePath
monitorDirectoryExistence = MonitorFile FileNotExists DirExists

-- | Monitor a single file or directory for changes, based on its modification
-- time. The monitored file is considered to have changed if it no longer
-- exists or if its modification time has changed.
--
monitorFileOrDirectory :: FilePath -> MonitorFilePath
monitorFileOrDirectory = MonitorFile FileModTime DirModTime

-- | Monitor a set of files (or directories) identified by a file glob.
-- The monitored glob is considered to have changed if the set of files
-- matching the glob changes (i.e. creations or deletions), or for files if the
-- modification time and content hash of any matching file has changed.
--
monitorFileGlob :: FilePathGlob -> MonitorFilePath
monitorFileGlob = MonitorFileGlob FileHashed DirExists

-- | Monitor a set of files (or directories) identified by a file glob for
-- existence only. The monitored glob is considered to have changed if the set
-- of files matching the glob changes (i.e. creations or deletions).
--
monitorFileGlobExistence :: FilePathGlob -> MonitorFilePath
monitorFileGlobExistence = MonitorFileGlob FileExists DirExists

-- | Creates a list of files to monitor when you search for a file which
-- unsuccessfully looked in @notFoundAtPaths@ before finding it at
-- @foundAtPath@.
monitorFileSearchPath :: [FilePath] -> FilePath -> [MonitorFilePath]
monitorFileSearchPath notFoundAtPaths foundAtPath =
    monitorFile foundAtPath
  : map monitorNonExistentFile notFoundAtPaths

-- | Similar to 'monitorFileSearchPath', but also instructs us to
-- monitor the hash of the found file.
monitorFileHashedSearchPath :: [FilePath] -> FilePath -> [MonitorFilePath]
monitorFileHashedSearchPath notFoundAtPaths foundAtPath =
    monitorFileHashed foundAtPath
  : map monitorNonExistentFile notFoundAtPaths


------------------------------------------------------------------------------
-- Implementation types, files status
--

-- | The state necessary to determine whether a set of monitored
-- files has changed.  It consists of two parts: a set of specific
-- files to be monitored (index by their path), and a list of
-- globs, which monitor may files at once.
data MonitorStateFileSet
   = MonitorStateFileSet ![MonitorStateFile]
                         ![MonitorStateGlob]
     -- Morally this is not actually a set but a bag (represented by lists).
     -- There is no principled reason to use a bag here rather than a set, but
     -- there is also no particular gain either. That said, we do preserve the
     -- order of the lists just to reduce confusion (and have predictable I/O
     -- patterns).

type Hash = Int

-- | The state necessary to determine whether a monitored file has changed.
--
-- This covers all the cases of 'MonitorFilePath' except for globs which is
-- covered separately by 'MonitorStateGlob'.
--
-- The @Maybe ModTime@ is to cover the case where we already consider the
-- file to have changed, either because it had already changed by the time we
-- did the snapshot (i.e. too new, changed since start of update process) or it
-- no longer exists at all.
--
data MonitorStateFile = MonitorStateFile !MonitorKindFile !MonitorKindDir
                                         !FilePath !MonitorStateFileStatus
  deriving Generic

data MonitorStateFileStatus
   = MonitorStateFileExists
   | MonitorStateFileModTime !ModTime        -- ^ cached file mtime
   | MonitorStateFileHashed  !ModTime !Hash  -- ^ cached mtime and content hash
   | MonitorStateDirExists
   | MonitorStateDirModTime  !ModTime        -- ^ cached dir mtime
   | MonitorStateNonExistent
   | MonitorStateAlreadyChanged
  deriving Generic

instance Binary MonitorStateFile
instance Binary MonitorStateFileStatus

-- | The state necessary to determine whether the files matched by a globbing
-- match have changed.
--
data MonitorStateGlob = MonitorStateGlob !MonitorKindFile !MonitorKindDir
                                         !FilePathRoot !MonitorStateGlobRel
  deriving Generic

data MonitorStateGlobRel
   = MonitorStateGlobDirs
       !Glob !FilePathGlobRel
       !ModTime
       ![(FilePath, MonitorStateGlobRel)] -- invariant: sorted

   | MonitorStateGlobFiles
       !Glob
       !ModTime
       ![(FilePath, MonitorStateFileStatus)] -- invariant: sorted

   | MonitorStateGlobDirTrailing
  deriving Generic

instance Binary MonitorStateGlob
instance Binary MonitorStateGlobRel

-- | We can build a 'MonitorStateFileSet' from a set of 'MonitorFilePath' by
-- inspecting the state of the file system, and we can go in the reverse
-- direction by just forgetting the extra info.
--
reconstructMonitorFilePaths :: MonitorStateFileSet -> [MonitorFilePath]
reconstructMonitorFilePaths (MonitorStateFileSet singlePaths globPaths) =
    map getSinglePath singlePaths
 ++ map getGlobPath globPaths
  where
    getSinglePath (MonitorStateFile kindfile kinddir filepath _) =
      MonitorFile kindfile kinddir filepath

    getGlobPath (MonitorStateGlob kindfile kinddir root gstate) =
      MonitorFileGlob kindfile kinddir $ FilePathGlob root $
        case gstate of
          MonitorStateGlobDirs  glob globs _ _ -> GlobDir  glob globs
          MonitorStateGlobFiles glob       _ _ -> GlobFile glob
          MonitorStateGlobDirTrailing          -> GlobDirTrailing

------------------------------------------------------------------------------
-- Checking the status of monitored files
--

-- | A monitor for detecting changes to a set of files. It can be used to
-- efficiently test if any of a set of files (specified individually or by
-- glob patterns) has changed since some snapshot. In addition, it also checks
-- for changes in a value (of type @a@), and when there are no changes in
-- either it returns a saved value (of type @b@).
--
-- The main use case looks like this: suppose we have some expensive action
-- that depends on certain pure inputs and reads some set of files, and
-- produces some pure result. We want to avoid re-running this action when it
-- would produce the same result. So we need to monitor the files the action
-- looked at, the other pure input values, and we need to cache the result.
-- Then at some later point, if the input value didn't change, and none of the
-- files changed, then we can re-use the cached result rather than re-running
-- the action.
--
-- This can be achieved using a 'FileMonitor'. Each 'FileMonitor' instance
-- saves state in a disk file, so the file for that has to be specified,
-- making sure it is unique. The pattern is to use 'checkFileMonitorChanged'
-- to see if there's been any change. If there is, re-run the action, keeping
-- track of the files, then use 'updateFileMonitor' to record the current
-- set of files to monitor, the current input value for the action, and the
-- result of the action.
--
-- The typical occurrence of this pattern is captured by 'rerunIfChanged'
-- and the 'Rebuild' monad. More complicated cases may need to use
-- 'checkFileMonitorChanged' and 'updateFileMonitor' directly.
--
data FileMonitor a b
   = FileMonitor {

       -- | The file where this 'FileMonitor' should store its state.
       --
       fileMonitorCacheFile :: FilePath,

       -- | Compares a new cache key with old one to determine if a
       -- corresponding cached value is still valid.
       --
       -- Typically this is just an equality test, but in some
       -- circumstances it can make sense to do things like subset
       -- comparisons.
       --
       -- The first arg is the new value, the second is the old cached value.
       --
       fileMonitorKeyValid :: a -> a -> Bool,

       -- | When this mode is enabled, if 'checkFileMonitorChanged' returns
       -- 'MonitoredValueChanged' then we have the guarantee that no files
       -- changed, that the value change was the only change. In the default
       -- mode no such guarantee is provided which is slightly faster.
       --
       fileMonitorCheckIfOnlyValueChanged :: Bool
  }

-- | Define a new file monitor.
--
-- It's best practice to define file monitor values once, and then use the
-- same value for 'checkFileMonitorChanged' and 'updateFileMonitor' as this
-- ensures you get the same types @a@ and @b@ for reading and writing.
--
-- The path of the file monitor itself must be unique because it keeps state
-- on disk and these would clash.
--
newFileMonitor :: Eq a => FilePath -- ^ The file to cache the state of the
                                   -- file monitor. Must be unique.
                       -> FileMonitor a b
newFileMonitor path = FileMonitor path (==) False

-- | The result of 'checkFileMonitorChanged': either the monitored files or
-- value changed (and it tells us which it was) or nothing changed and we get
-- the cached result.
--
data MonitorChanged a b =
     -- | The monitored files and value did not change. The cached result is
     -- @b@.
     --
     -- The set of monitored files is also returned. This is useful
     -- for composing or nesting 'FileMonitor's.
     MonitorUnchanged b [MonitorFilePath]

     -- | The monitor found that something changed. The reason is given.
     --
   | MonitorChanged (MonitorChangedReason a)
  deriving Show

-- | What kind of change 'checkFileMonitorChanged' detected.
--
data MonitorChangedReason a =

     -- | One of the files changed (existence, file type, mtime or file
     -- content, depending on the 'MonitorFilePath' in question)
     MonitoredFileChanged FilePath

     -- | The pure input value changed.
     --
     -- The previous cached key value is also returned. This is sometimes
     -- useful when using a 'fileMonitorKeyValid' function that is not simply
     -- '(==)', when invalidation can be partial. In such cases it can make
     -- sense to 'updateFileMonitor' with a key value that's a combination of
     -- the new and old (e.g. set union).
   | MonitoredValueChanged a

     -- | There was no saved monitor state, cached value etc. Ie the file
     -- for the 'FileMonitor' does not exist.
   | MonitorFirstRun

     -- | There was existing state, but we could not read it. This typically
     -- happens when the code has changed compared to an existing 'FileMonitor'
     -- cache file and type of the input value or cached value has changed such
     -- that we cannot decode the values. This is completely benign as we can
     -- treat is just as if there were no cache file and re-run.
   | MonitorCorruptCache
  deriving (Eq, Show, Functor)

-- | Test if the input value or files monitored by the 'FileMonitor' have
-- changed. If not, return the cached value.
--
-- See 'FileMonitor' for a full explanation.
--
checkFileMonitorChanged
  :: (Binary a, Binary b)
  => FileMonitor a b            -- ^ cache file path
  -> FilePath                   -- ^ root directory
  -> a                          -- ^ guard or key value
  -> IO (MonitorChanged a b)    -- ^ did the key or any paths change?
checkFileMonitorChanged
    monitor@FileMonitor { fileMonitorKeyValid,
                          fileMonitorCheckIfOnlyValueChanged }
    root currentKey =

    -- Consider it a change if the cache file does not exist,
    -- or we cannot decode it. Sadly ErrorCall can still happen, despite
    -- using decodeFileOrFail, e.g. Data.Char.chr errors

    handleDoesNotExist (MonitorChanged MonitorFirstRun) $
    handleErrorCall    (MonitorChanged MonitorCorruptCache) $
          readCacheFile monitor
      >>= either (\_ -> return (MonitorChanged MonitorCorruptCache))
                 checkStatusCache

  where
    checkStatusCache (cachedFileStatus, cachedKey, cachedResult) = do
        change <- checkForChanges
        case change of
          Just reason -> return (MonitorChanged reason)
          Nothing     -> return (MonitorUnchanged cachedResult monitorFiles)
            where monitorFiles = reconstructMonitorFilePaths cachedFileStatus
      where
        -- In fileMonitorCheckIfOnlyValueChanged mode we want to guarantee that
        -- if we return MonitoredValueChanged that only the value changed.
        -- We do that by checkin for file changes first. Otherwise it makes
        -- more sense to do the cheaper test first.
        checkForChanges
          | fileMonitorCheckIfOnlyValueChanged
          = checkFileChange cachedFileStatus cachedKey cachedResult
              `mplusMaybeT`
            checkValueChange cachedKey

          | otherwise
          = checkValueChange cachedKey
              `mplusMaybeT`
            checkFileChange cachedFileStatus cachedKey cachedResult

    mplusMaybeT :: Monad m => m (Maybe a) -> m (Maybe a) -> m (Maybe a)
    mplusMaybeT ma mb = do
      mx <- ma
      case mx of
        Nothing -> mb
        Just x  -> return (Just x)

    -- Check if the guard value has changed
    checkValueChange cachedKey
      | not (fileMonitorKeyValid currentKey cachedKey)
      = return (Just (MonitoredValueChanged cachedKey))
      | otherwise
      = return Nothing

    -- Check if any file has changed
    checkFileChange cachedFileStatus cachedKey cachedResult = do
      res <- probeFileSystem root cachedFileStatus
      case res of
        -- Some monitored file has changed
        Left changedPath ->
          return (Just (MonitoredFileChanged (normalise changedPath)))

        -- No monitored file has changed
        Right (cachedFileStatus', cacheStatus) -> do

          -- But we might still want to update the cache
          whenCacheChanged cacheStatus $
            rewriteCacheFile monitor cachedFileStatus' cachedKey cachedResult

          return Nothing

-- | Helper for reading the cache file.
--
-- This determines the type and format of the binary cache file.
--
readCacheFile :: (Binary a, Binary b)
              => FileMonitor a b
              -> IO (Either String (MonitorStateFileSet, a, b))
readCacheFile FileMonitor {fileMonitorCacheFile} =
    withBinaryFile fileMonitorCacheFile ReadMode $ \hnd ->
      decodeOrFailIO =<< BS.hGetContents hnd

-- | Helper for writing the cache file.
--
-- This determines the type and format of the binary cache file.
--
rewriteCacheFile :: (Binary a, Binary b)
                 => FileMonitor a b
                 -> MonitorStateFileSet -> a -> b -> IO ()
rewriteCacheFile FileMonitor {fileMonitorCacheFile} fileset key result =
    writeFileAtomic fileMonitorCacheFile $
      encode (fileset, key, result)

-- | Probe the file system to see if any of the monitored files have changed.
--
-- It returns Nothing if any file changed, or returns a possibly updated
-- file 'MonitorStateFileSet' plus an indicator of whether it actually changed.
--
-- We may need to update the cache since there may be changes in the filesystem
-- state which don't change any of our affected files.
--
-- Consider the glob @{proj1,proj2}\/\*.cabal@. Say we first run and find a
-- @proj1@ directory containing @proj1.cabal@ yet no @proj2@. If we later run
-- and find @proj2@ was created, yet contains no files matching @*.cabal@ then
-- we want to update the cache despite no changes in our relevant file set.
-- Specifically, we should add an mtime for this directory so we can avoid
-- re-traversing the directory in future runs.
--
probeFileSystem :: FilePath -> MonitorStateFileSet
                -> IO (Either FilePath (MonitorStateFileSet, CacheChanged))
probeFileSystem root (MonitorStateFileSet singlePaths globPaths) =
  runChangedM $ do
    sequence_
      [ probeMonitorStateFileStatus root file status
      | MonitorStateFile _ _ file status <- singlePaths ]
    -- The glob monitors can require state changes
    globPaths' <-
      sequence
        [ probeMonitorStateGlob root globPath
        | globPath <- globPaths ]
    return (MonitorStateFileSet singlePaths globPaths')


-----------------------------------------------
-- Monad for checking for file system changes
--
-- We need to be able to bail out if we detect a change (using ExceptT),
-- but if there's no change we need to be able to rebuild the monitor
-- state. And we want to optimise that rebuilding by keeping track if
-- anything actually changed (using StateT), so that in the typical case
-- we can avoid rewriting the state file.

newtype ChangedM a = ChangedM (StateT CacheChanged (ExceptT FilePath IO) a)
  deriving (Functor, Applicative, Monad, MonadIO)

runChangedM :: ChangedM a -> IO (Either FilePath (a, CacheChanged))
runChangedM (ChangedM action) =
  runExceptT $ State.runStateT action CacheUnchanged

somethingChanged :: FilePath -> ChangedM a
somethingChanged path = ChangedM $ throwError path

cacheChanged :: ChangedM ()
cacheChanged = ChangedM $ State.put CacheChanged

mapChangedFile :: (FilePath -> FilePath) -> ChangedM a -> ChangedM a
mapChangedFile adjust (ChangedM a) =
    ChangedM (mapStateT (withExceptT adjust) a)

data CacheChanged = CacheChanged | CacheUnchanged

whenCacheChanged :: Monad m => CacheChanged -> m () -> m ()
whenCacheChanged CacheChanged action = action
whenCacheChanged CacheUnchanged _    = return ()

----------------------

-- | Probe the file system to see if a single monitored file has changed.
--
probeMonitorStateFileStatus :: FilePath -> FilePath
                            -> MonitorStateFileStatus
                            -> ChangedM ()
probeMonitorStateFileStatus root file status =
    case status of
      MonitorStateFileExists ->
        probeFileExistence root file

      MonitorStateFileModTime mtime ->
        probeFileModificationTime root file mtime

      MonitorStateFileHashed  mtime hash ->
        probeFileModificationTimeAndHash root file mtime hash

      MonitorStateDirExists ->
        probeDirExistence root file

      MonitorStateDirModTime mtime ->
        probeFileModificationTime root file mtime

      MonitorStateNonExistent ->
        probeFileNonExistence root file

      MonitorStateAlreadyChanged ->
        somethingChanged file


-- | Probe the file system to see if a monitored file glob has changed.
--
probeMonitorStateGlob :: FilePath      -- ^ root path
                      -> MonitorStateGlob
                      -> ChangedM MonitorStateGlob
probeMonitorStateGlob relroot
                      (MonitorStateGlob kindfile kinddir globroot glob) = do
    root <- liftIO $ getFilePathRootDirectory globroot relroot
    case globroot of
      FilePathRelative ->
        MonitorStateGlob kindfile kinddir globroot <$>
        probeMonitorStateGlobRel kindfile kinddir root "." glob

      -- for absolute cases, make the changed file we report absolute too
      _ ->
        mapChangedFile (root </>) $
        MonitorStateGlob kindfile kinddir globroot <$>
        probeMonitorStateGlobRel kindfile kinddir root "" glob

probeMonitorStateGlobRel :: MonitorKindFile -> MonitorKindDir
                         -> FilePath      -- ^ root path
                         -> FilePath      -- ^ path of the directory we are
                                          --   looking in relative to @root@
                         -> MonitorStateGlobRel
                         -> ChangedM MonitorStateGlobRel
probeMonitorStateGlobRel kindfile kinddir root dirName
                        (MonitorStateGlobDirs glob globPath mtime children) = do
    change <- liftIO $ checkDirectoryModificationTime (root </> dirName) mtime
    case change of
      Nothing -> do
        children' <- sequence
          [ do fstate' <- probeMonitorStateGlobRel
                            kindfile kinddir root
                            (dirName </> fname) fstate
               return (fname, fstate')
          | (fname, fstate) <- children ]
        return $! MonitorStateGlobDirs glob globPath mtime children'

      Just mtime' -> do
        -- directory modification time changed:
        -- a matching subdir may have been added or deleted
        matches <- filterM (\entry -> let subdir = root </> dirName </> entry
                                       in liftIO $ doesDirectoryExist subdir)
                 . filter (matchGlob glob)
               =<< liftIO (getDirectoryContents (root </> dirName))

        children' <- mapM probeMergeResult $
                          mergeBy (\(path1,_) path2 -> compare path1 path2)
                                  children
                                  (sort matches)
        return $! MonitorStateGlobDirs glob globPath mtime' children'
        -- Note that just because the directory has changed, we don't force
        -- a cache rewrite with 'cacheChanged' since that has some cost, and
        -- all we're saving is scanning the directory. But we do rebuild the
        -- cache with the new mtime', so that if the cache is rewritten for
        -- some other reason, we'll take advantage of that.

  where
    probeMergeResult :: MergeResult (FilePath, MonitorStateGlobRel) FilePath
                     -> ChangedM (FilePath, MonitorStateGlobRel)

    -- Only in cached (directory deleted)
    probeMergeResult (OnlyInLeft (path, fstate)) = do
      case allMatchingFiles (dirName </> path) fstate of
        [] -> return (path, fstate)
        -- Strictly speaking we should be returning 'CacheChanged' above
        -- as we should prune the now-missing 'MonitorStateGlobRel'. However
        -- we currently just leave these now-redundant entries in the
        -- cache as they cost no IO and keeping them allows us to avoid
        -- rewriting the cache.
        (file:_) -> somethingChanged file

    -- Only in current filesystem state (directory added)
    probeMergeResult (OnlyInRight path) = do
      fstate <- liftIO $ buildMonitorStateGlobRel Nothing Map.empty
                           kindfile kinddir root (dirName </> path) globPath
      case allMatchingFiles (dirName </> path) fstate of
        (file:_) -> somethingChanged file
        -- This is the only case where we use 'cacheChanged' because we can
        -- have a whole new dir subtree (of unbounded size and cost), so we
        -- need to save the state of that new subtree in the cache.
        [] -> cacheChanged >> return (path, fstate)

    -- Found in path
    probeMergeResult (InBoth (path, fstate) _) = do
      fstate' <- probeMonitorStateGlobRel kindfile kinddir
                                          root (dirName </> path) fstate
      return (path, fstate')

    -- | Does a 'MonitorStateGlob' have any relevant files within it?
    allMatchingFiles :: FilePath -> MonitorStateGlobRel -> [FilePath]
    allMatchingFiles dir (MonitorStateGlobFiles _ _   entries) =
      [ dir </> fname | (fname, _) <- entries ]
    allMatchingFiles dir (MonitorStateGlobDirs  _ _ _ entries) =
      [ res
      | (subdir, fstate) <- entries
      , res <- allMatchingFiles (dir </> subdir) fstate ]
    allMatchingFiles dir MonitorStateGlobDirTrailing =
      [dir]

probeMonitorStateGlobRel _ _ root dirName
                         (MonitorStateGlobFiles glob mtime children) = do
    change <- liftIO $ checkDirectoryModificationTime (root </> dirName) mtime
    mtime' <- case change of
      Nothing     -> return mtime
      Just mtime' -> do
        -- directory modification time changed:
        -- a matching file may have been added or deleted
        matches <- return . filter (matchGlob glob)
               =<< liftIO (getDirectoryContents (root </> dirName))

        mapM_ probeMergeResult $
              mergeBy (\(path1,_) path2 -> compare path1 path2)
                      children
                      (sort matches)
        return mtime'

    -- Check that none of the children have changed
    forM_ children $ \(file, status) ->
      probeMonitorStateFileStatus root (dirName </> file) status


    return (MonitorStateGlobFiles glob mtime' children)
    -- Again, we don't force a cache rewite with 'cacheChanged', but we do use
    -- the new mtime' if any.
  where
    probeMergeResult :: MergeResult (FilePath, MonitorStateFileStatus) FilePath
                     -> ChangedM ()
    probeMergeResult mr = case mr of
      InBoth _ _            -> return ()
    -- this is just to be able to accurately report which file changed:
      OnlyInLeft  (path, _) -> somethingChanged (dirName </> path)
      OnlyInRight path      -> somethingChanged (dirName </> path)

probeMonitorStateGlobRel _ _ _ _ MonitorStateGlobDirTrailing =
    return MonitorStateGlobDirTrailing

------------------------------------------------------------------------------

-- | Update the input value and the set of files monitored by the
-- 'FileMonitor', plus the cached value that may be returned in future.
--
-- This takes a snapshot of the state of the monitored files right now, so
-- 'checkFileMonitorChanged' will look for file system changes relative to
-- this snapshot.
--
-- This is typically done once the action has been completed successfully and
-- we have the action's result and we know what files it looked at. See
-- 'FileMonitor' for a full explanation.
--
-- If we do take the snapshot after the action has completed then we have a
-- problem. The problem is that files might have changed /while/ the action was
-- running but /after/ the action read them. If we take the snapshot after the
-- action completes then we will miss these changes. The solution is to record
-- a timestamp before beginning execution of the action and then we make the
-- conservative assumption that any file that has changed since then has
-- already changed, ie the file monitor state for these files will be such that
-- 'checkFileMonitorChanged' will report that they have changed.
--
-- So if you do use 'updateFileMonitor' after the action (so you can discover
-- the files used rather than predicting them in advance) then use
-- 'beginUpdateFileMonitor' to get a timestamp and pass that. Alternatively,
-- if you take the snapshot in advance of the action, or you're not monitoring
-- any files then you can use @Nothing@ for the timestamp parameter.
--
updateFileMonitor
  :: (Binary a, Binary b)
  => FileMonitor a b          -- ^ cache file path
  -> FilePath                 -- ^ root directory
  -> Maybe MonitorTimestamp   -- ^ timestamp when the update action started
  -> [MonitorFilePath]        -- ^ files of interest relative to root
  -> a                        -- ^ the current key value
  -> b                        -- ^ the current result value
  -> IO ()
updateFileMonitor monitor root startTime monitorFiles
                  cachedKey cachedResult = do
    hashcache <- readCacheFileHashes monitor
    msfs <- buildMonitorStateFileSet startTime hashcache root monitorFiles
    rewriteCacheFile monitor msfs cachedKey cachedResult

-- | A timestamp to help with the problem of file changes during actions.
-- See 'updateFileMonitor' for details.
--
newtype MonitorTimestamp = MonitorTimestamp ModTime

-- | Record a timestamp at the beginning of an action, and when the action
-- completes call 'updateFileMonitor' passing it the timestamp.
-- See 'updateFileMonitor' for details.
--
beginUpdateFileMonitor :: IO MonitorTimestamp
beginUpdateFileMonitor = MonitorTimestamp <$> getCurTime

-- | Take the snapshot of the monitored files. That is, given the
-- specification of the set of files we need to monitor, inspect the state
-- of the file system now and collect the information we'll need later to
-- determine if anything has changed.
--
buildMonitorStateFileSet :: Maybe MonitorTimestamp -- ^ optional: timestamp
                                              -- of the start of the action
                         -> FileHashCache     -- ^ existing file hashes
                         -> FilePath          -- ^ root directory
                         -> [MonitorFilePath] -- ^ patterns of interest
                                              --   relative to root
                         -> IO MonitorStateFileSet
buildMonitorStateFileSet mstartTime hashcache root =
    go [] []
  where
    go :: [MonitorStateFile] -> [MonitorStateGlob]
       -> [MonitorFilePath] -> IO MonitorStateFileSet
    go !singlePaths !globPaths [] =
      return (MonitorStateFileSet (reverse singlePaths) (reverse globPaths))

    go !singlePaths !globPaths
       (MonitorFile kindfile kinddir path : monitors) = do
      monitorState <- MonitorStateFile kindfile kinddir path
                  <$> buildMonitorStateFile mstartTime hashcache
                                            kindfile kinddir root path
      go (monitorState : singlePaths) globPaths monitors

    go !singlePaths !globPaths
       (MonitorFileGlob kindfile kinddir globPath : monitors) = do
      monitorState <- buildMonitorStateGlob mstartTime hashcache
                                            kindfile kinddir root globPath
      go singlePaths (monitorState : globPaths) monitors


buildMonitorStateFile :: Maybe MonitorTimestamp -- ^ start time of update
                      -> FileHashCache          -- ^ existing file hashes
                      -> MonitorKindFile -> MonitorKindDir
                      -> FilePath               -- ^ the root directory
                      -> FilePath
                      -> IO MonitorStateFileStatus
buildMonitorStateFile mstartTime hashcache kindfile kinddir root path = do
    let abspath = root </> path
    isFile <- doesFileExist abspath
    isDir  <- doesDirectoryExist abspath
    case (isFile, kindfile, isDir, kinddir) of
      (_, FileNotExists, _, DirNotExists) ->
        -- we don't need to care if it exists now, since we check at probe time
        return MonitorStateNonExistent

      (False, _, False, _) ->
        return MonitorStateAlreadyChanged

      (True, FileExists, _, _)  ->
        return MonitorStateFileExists

      (True, FileModTime, _, _) ->
        handleIOException MonitorStateAlreadyChanged $ do
          mtime <- getModTime abspath
          if changedDuringUpdate mstartTime mtime
            then return MonitorStateAlreadyChanged
            else return (MonitorStateFileModTime mtime)

      (True, FileHashed, _, _) ->
        handleIOException MonitorStateAlreadyChanged $ do
          mtime <- getModTime abspath
          if changedDuringUpdate mstartTime mtime
            then return MonitorStateAlreadyChanged
            else do hash <- getFileHash hashcache abspath abspath mtime
                    return (MonitorStateFileHashed mtime hash)

      (_, _, True, DirExists) ->
        return MonitorStateDirExists

      (_, _, True, DirModTime) ->
        handleIOException MonitorStateAlreadyChanged $ do
          mtime <- getModTime abspath
          if changedDuringUpdate mstartTime mtime
            then return MonitorStateAlreadyChanged
            else return (MonitorStateDirModTime mtime)

      (False, _, True,  DirNotExists) -> return MonitorStateAlreadyChanged
      (True, FileNotExists, False, _) -> return MonitorStateAlreadyChanged

-- | If we have a timestamp for the beginning of the update, then any file
-- mtime later than this means that it changed during the update and we ought
-- to consider the file as already changed.
--
changedDuringUpdate :: Maybe MonitorTimestamp -> ModTime -> Bool
changedDuringUpdate (Just (MonitorTimestamp startTime)) mtime
                        = mtime > startTime
changedDuringUpdate _ _ = False

-- | Much like 'buildMonitorStateFileSet' but for the somewhat complicated case
-- of a file glob.
--
-- This gets used both by 'buildMonitorStateFileSet' when we're taking the
-- file system snapshot, but also by 'probeGlobStatus' as part of checking
-- the monitored (globed) files for changes when we find a whole new subtree.
--
buildMonitorStateGlob :: Maybe MonitorTimestamp -- ^ start time of update
                      -> FileHashCache     -- ^ existing file hashes
                      -> MonitorKindFile -> MonitorKindDir
                      -> FilePath     -- ^ the root directory
                      -> FilePathGlob -- ^ the matching glob
                      -> IO MonitorStateGlob
buildMonitorStateGlob mstartTime hashcache kindfile kinddir relroot
                      (FilePathGlob globroot globPath) = do
    root <- liftIO $ getFilePathRootDirectory globroot relroot
    MonitorStateGlob kindfile kinddir globroot <$>
      buildMonitorStateGlobRel
        mstartTime hashcache kindfile kinddir root "." globPath

buildMonitorStateGlobRel :: Maybe MonitorTimestamp -- ^ start time of update
                         -> FileHashCache   -- ^ existing file hashes
                         -> MonitorKindFile -> MonitorKindDir
                         -> FilePath        -- ^ the root directory
                         -> FilePath        -- ^ directory we are examining
                                            --   relative to the root
                         -> FilePathGlobRel -- ^ the matching glob
                         -> IO MonitorStateGlobRel
buildMonitorStateGlobRel mstartTime hashcache kindfile kinddir root
                         dir globPath = do
    let absdir = root </> dir
    dirEntries <- getDirectoryContents absdir
    dirMTime   <- getModTime absdir
    case globPath of
      GlobDir glob globPath' -> do
        subdirs <- filterM (\subdir -> doesDirectoryExist (absdir </> subdir))
                 $ filter (matchGlob glob) dirEntries
        subdirStates <-
          forM (sort subdirs) $ \subdir -> do
            fstate <- buildMonitorStateGlobRel
                        mstartTime hashcache kindfile kinddir root
                        (dir </> subdir) globPath'
            return (subdir, fstate)
        return $! MonitorStateGlobDirs glob globPath' dirMTime subdirStates

      GlobFile glob -> do
        let files = filter (matchGlob glob) dirEntries
        filesStates <-
          forM (sort files) $ \file -> do
            fstate <- buildMonitorStateFile
                        mstartTime hashcache kindfile kinddir root
                        (dir </> file)
            return (file, fstate)
        return $! MonitorStateGlobFiles glob dirMTime filesStates

      GlobDirTrailing ->
        return MonitorStateGlobDirTrailing


-- | We really want to avoid re-hashing files all the time. We already make
-- the assumption that if a file mtime has not changed then we don't need to
-- bother checking if the content hash has changed. We can apply the same
-- assumption when updating the file monitor state. In the typical case of
-- updating a file monitor the set of files is the same or largely the same so
-- we can grab the previously known content hashes with their corresponding
-- mtimes.
--
type FileHashCache = Map FilePath (ModTime, Hash)

-- | We declare it a cache hit if the mtime of a file is the same as before.
--
lookupFileHashCache :: FileHashCache -> FilePath -> ModTime -> Maybe Hash
lookupFileHashCache hashcache file mtime = do
    (mtime', hash) <- Map.lookup file hashcache
    guard (mtime' == mtime)
    return hash

-- | Either get it from the cache or go read the file
getFileHash :: FileHashCache -> FilePath -> FilePath -> ModTime -> IO Hash
getFileHash hashcache relfile absfile mtime =
    case lookupFileHashCache hashcache relfile mtime of
      Just hash -> return hash
      Nothing   -> readFileHash absfile

-- | Build a 'FileHashCache' from the previous 'MonitorStateFileSet'. While
-- in principle we could preserve the structure of the previous state, given
-- that the set of files to monitor can change then it's simpler just to throw
-- away the structure and use a finite map.
--
readCacheFileHashes :: (Binary a, Binary b)
                    => FileMonitor a b -> IO FileHashCache
readCacheFileHashes monitor =
    handleDoesNotExist Map.empty $
    handleErrorCall    Map.empty $ do
      res <- readCacheFile monitor
      case res of
        Left _             -> return Map.empty
        Right (msfs, _, _) -> return (mkFileHashCache msfs)
  where
    mkFileHashCache :: MonitorStateFileSet -> FileHashCache
    mkFileHashCache (MonitorStateFileSet singlePaths globPaths) =
                    collectAllFileHashes singlePaths
        `Map.union` collectAllGlobHashes globPaths

    collectAllFileHashes singlePaths =
      Map.fromList [ (fpath, (mtime, hash))
                   | MonitorStateFile _ _ fpath
                       (MonitorStateFileHashed mtime hash) <- singlePaths ]

    collectAllGlobHashes globPaths =
      Map.fromList [ (fpath, (mtime, hash))
                   | MonitorStateGlob _ _ _ gstate <- globPaths
                   , (fpath, (mtime, hash)) <- collectGlobHashes "" gstate ]

    collectGlobHashes dir (MonitorStateGlobDirs _ _ _ entries) =
      [ res
      | (subdir, fstate) <- entries
      , res <- collectGlobHashes (dir </> subdir) fstate ]

    collectGlobHashes dir (MonitorStateGlobFiles  _ _ entries) =
      [ (dir </> fname, (mtime, hash))
      | (fname, MonitorStateFileHashed mtime hash) <- entries ]

    collectGlobHashes _dir MonitorStateGlobDirTrailing =
      []


------------------------------------------------------------------------------
-- Utils
--

-- | Within the @root@ directory, check if @file@ has its 'ModTime' is
-- the same as @mtime@, short-circuiting if it is different.
probeFileModificationTime :: FilePath -> FilePath -> ModTime -> ChangedM ()
probeFileModificationTime root file mtime = do
    unchanged <- liftIO $ checkModificationTimeUnchanged root file mtime
    unless unchanged (somethingChanged file)

-- | Within the @root@ directory, check if @file@ has its 'ModTime' and
-- 'Hash' is the same as @mtime@ and @hash@, short-circuiting if it is
-- different.
probeFileModificationTimeAndHash :: FilePath -> FilePath -> ModTime -> Hash
                                 -> ChangedM ()
probeFileModificationTimeAndHash root file mtime hash = do
    unchanged <- liftIO $
      checkFileModificationTimeAndHashUnchanged root file mtime hash
    unless unchanged (somethingChanged file)

-- | Within the @root@ directory, check if @file@ still exists as a file.
-- If it *does not* exist, short-circuit.
probeFileExistence :: FilePath -> FilePath -> ChangedM ()
probeFileExistence root file = do
    existsFile <- liftIO $ doesFileExist (root </> file)
    unless existsFile (somethingChanged file)

-- | Within the @root@ directory, check if @dir@ still exists.
-- If it *does not* exist, short-circuit.
probeDirExistence :: FilePath -> FilePath -> ChangedM ()
probeDirExistence root dir = do
    existsDir  <- liftIO $ doesDirectoryExist (root </> dir)
    unless existsDir (somethingChanged dir)

-- | Within the @root@ directory, check if @file@ still does not exist.
-- If it *does* exist, short-circuit.
probeFileNonExistence :: FilePath -> FilePath -> ChangedM ()
probeFileNonExistence root file = do
    existsFile <- liftIO $ doesFileExist (root </> file)
    existsDir  <- liftIO $ doesDirectoryExist (root </> file)
    when (existsFile || existsDir) (somethingChanged file)

-- | Returns @True@ if, inside the @root@ directory, @file@ has the same
-- 'ModTime' as @mtime@.
checkModificationTimeUnchanged :: FilePath -> FilePath
                               -> ModTime -> IO Bool
checkModificationTimeUnchanged root file mtime =
  handleIOException False $ do
    mtime' <- getModTime (root </> file)
    return (mtime == mtime')

-- | Returns @True@ if, inside the @root@ directory, @file@ has the
-- same 'ModTime' and 'Hash' as @mtime and @chash@.
checkFileModificationTimeAndHashUnchanged :: FilePath -> FilePath
                                          -> ModTime -> Hash -> IO Bool
checkFileModificationTimeAndHashUnchanged root file mtime chash =
  handleIOException False $ do
    mtime' <- getModTime (root </> file)
    if mtime == mtime'
      then return True
      else do
        chash' <- readFileHash (root </> file)
        return (chash == chash')

-- | Read a non-cryptographic hash of a @file@.
readFileHash :: FilePath -> IO Hash
readFileHash file =
    withBinaryFile file ReadMode $ \hnd ->
      evaluate . Hashable.hash =<< BS.hGetContents hnd

-- | Given a directory @dir@, return @Nothing@ if its 'ModTime'
-- is the same as @mtime@, and the new 'ModTime' if it is not.
checkDirectoryModificationTime :: FilePath -> ModTime -> IO (Maybe ModTime)
checkDirectoryModificationTime dir mtime =
  handleIOException Nothing $ do
    mtime' <- getModTime dir
    if mtime == mtime'
      then return Nothing
      else return (Just mtime')

-- | Run an IO computation, returning @e@ if there is an 'error'
-- call. ('ErrorCall')
handleErrorCall :: a -> IO a -> IO a
handleErrorCall e =
    handle (\(ErrorCall _) -> return e)

-- | Run an IO computation, returning @e@ if there is any 'IOException'.
--
-- This policy is OK in the file monitor code because it just causes the
-- monitor to report that something changed, and then code reacting to that
-- will normally encounter the same IO exception when it re-runs the action
-- that uses the file.
--
handleIOException :: a -> IO a -> IO a
handleIOException e =
    handle (anyIOException e)
  where
    anyIOException :: a -> IOException -> IO a
    anyIOException x _ = return x


------------------------------------------------------------------------------
-- Instances
--

instance Binary MonitorStateFileSet where
  put (MonitorStateFileSet singlePaths globPaths) = do
    put (1 :: Int) -- version
    put singlePaths
    put globPaths
  get = do
    ver <- get
    if ver == (1 :: Int)
      then do singlePaths <- get
              globPaths   <- get
              return $! MonitorStateFileSet singlePaths globPaths
      else fail "MonitorStateFileSet: wrong version"

-- Binary

decodeOrFailIO :: Binary a => ByteString -> IO (Either String a)
decodeOrFailIO bs =
  catch (evaluate (decode bs) >>= return . Right)
  $ \(ErrorCall str) -> return $ Left str

-- Time

-- | An opaque type representing a file's modification time, represented
-- internally as a 64-bit unsigned integer in the Windows UTC format.
newtype ModTime = ModTime Word64
                deriving (Binary, Bounded, Eq, Ord)

-- instance Show ModTime where
--   show (ModTime x) = show x

-- instance Read ModTime where
--   readsPrec p str = map (first ModTime) (readsPrec p str)

-- | Return modification time of the given file. Works around the low clock
-- resolution problem that 'getModificationTime' has on GHC < 7.8.
--
-- This is a modified version of the code originally written for Shake by Neil
-- Mitchell. See module Development.Shake.FileInfo.
getModTime :: FilePath -> IO ModTime

#if defined mingw32_HOST_OS

-- Directly against the Win32 API.
getModTime path = allocaBytes size_WIN32_FILE_ATTRIBUTE_DATA $ \info -> do
  res <- getFileAttributesEx path info
  if not res
    then do
      let err = mkIOError doesNotExistErrorType
                "Distribution.Compat.Time.getModTime"
                Nothing (Just path)
      ioError err
    else do
      dwLow  <- peekByteOff info
                index_WIN32_FILE_ATTRIBUTE_DATA_ftLastWriteTime_dwLowDateTime
      dwHigh <- peekByteOff info
                index_WIN32_FILE_ATTRIBUTE_DATA_ftLastWriteTime_dwHighDateTime
#if MIN_VERSION_base(4,7,0)
      let qwTime =
            (fromIntegral (dwHigh :: DWORD) `unsafeShiftL` finiteBitSize dwHigh)
            .|. (fromIntegral (dwLow :: DWORD))
#else
      let qwTime =
            (fromIntegral (dwHigh :: DWORD) `unsafeShiftL` bitSize dwHigh)
            .|. (fromIntegral (dwLow :: DWORD))
#endif
      return $! ModTime (qwTime :: Word64)

#ifdef x86_64_HOST_ARCH
#define CALLCONV ccall
#else
#define CALLCONV stdcall
#endif

foreign import CALLCONV "windows.h GetFileAttributesExW"
  c_getFileAttributesEx :: LPCTSTR -> Int32 -> LPVOID -> Prelude.IO BOOL

getFileAttributesEx :: String -> LPVOID -> IO BOOL
getFileAttributesEx path lpFileInformation =
  withTString path $ \c_path ->
      c_getFileAttributesEx c_path getFileExInfoStandard lpFileInformation

getFileExInfoStandard :: Int32
getFileExInfoStandard = 0

size_WIN32_FILE_ATTRIBUTE_DATA :: Int
size_WIN32_FILE_ATTRIBUTE_DATA = 36

index_WIN32_FILE_ATTRIBUTE_DATA_ftLastWriteTime_dwLowDateTime :: Int
index_WIN32_FILE_ATTRIBUTE_DATA_ftLastWriteTime_dwLowDateTime = 20

index_WIN32_FILE_ATTRIBUTE_DATA_ftLastWriteTime_dwHighDateTime :: Int
index_WIN32_FILE_ATTRIBUTE_DATA_ftLastWriteTime_dwHighDateTime = 24

#else

-- Directly against the unix library.
getModTime path = do
    st <- getFileStatus path
    return $! (extractFileTime st)

extractFileTime :: FileStatus -> ModTime
#if MIN_VERSION_unix(2,6,0)
extractFileTime x = posixTimeToModTime (modificationTimeHiRes x)
#else
extractFileTime x = posixSecondsToModTime $ fromIntegral $ fromEnum $
                    modificationTime x
#endif

#endif

windowsTick, secToUnixEpoch :: Word64
windowsTick    = 10000000
secToUnixEpoch = 11644473600

-- | Convert POSIX milliseconds to ModTime.
-- posixMilliSecondsToModTime :: Int64 -> ModTime
-- posixMilliSecondsToModTime s =
--   ModTime $ ((fromIntegral s :: Word64) + (secToUnixEpoch * 1000)) * (windowsTick `div` 1000)

-- | Convert POSIX seconds to ModTime.
-- posixSecondsToModTime :: Int64 -> ModTime
-- posixSecondsToModTime s =
--   ModTime $ ((fromIntegral s :: Word64) + secToUnixEpoch) * windowsTick

-- | Convert 'POSIXTime' to 'ModTime'.
posixTimeToModTime :: POSIXTime -> ModTime
posixTimeToModTime p = ModTime $ (ceiling $ p * 1e7) -- 100 ns precision
                       + (secToUnixEpoch * windowsTick)

-- | Return the current time as 'ModTime'.
getCurTime :: IO ModTime
getCurTime = posixTimeToModTime `fmap` getPOSIXTime -- Uses 'gettimeofday'.

-- Glob

-- | A file path specified by globbing
--
data FilePathGlob = FilePathGlob FilePathRoot FilePathGlobRel
  deriving (Eq, Show, Generic)

data FilePathGlobRel
   = GlobDir  !Glob !FilePathGlobRel
   | GlobFile !Glob
   | GlobDirTrailing                -- ^ trailing dir, a glob ending in @/@
  deriving (Eq, Show, Generic)

-- | A single directory or file component of a globbed path
type Glob = [GlobPiece]

-- | A piece of a globbing pattern
data GlobPiece = WildCard
               | Literal String
               | Union [Glob]
  deriving (Eq, Show, Generic)

data FilePathRoot
   = FilePathRelative
   | FilePathRoot FilePath -- ^ e.g. @"/"@, @"c:\"@ or result of 'takeDrive'
   | FilePathHomeDir
  deriving (Eq, Show, Generic)

instance Binary FilePathGlob
instance Binary FilePathRoot
instance Binary FilePathGlobRel
instance Binary GlobPiece


-- | Check if a 'FilePathGlob' doesn't actually make use of any globbing and
-- is in fact equivalent to a non-glob 'FilePath'.
--
-- If it is trivial in this sense then the result is the equivalent constant
-- 'FilePath'. On the other hand if it is not trivial (so could in principle
-- match more than one file) then the result is @Nothing@.
--
-- isTrivialFilePathGlob :: FilePathGlob -> Maybe FilePath
-- isTrivialFilePathGlob (FilePathGlob root pathglob) =
--     case root of
--       FilePathRelative       -> go []      pathglob
--       FilePathRoot root'     -> go [root'] pathglob
--       FilePathHomeDir        -> Nothing
--   where
--     go paths (GlobDir  [Literal path] globs) = go (path:paths) globs
--     go paths (GlobFile [Literal path]) = Just (joinPath (reverse (path:paths)))
--     go paths  GlobDirTrailing          = Just (addTrailingPathSeparator
--                                                  (joinPath (reverse paths)))
--     go _ _ = Nothing

-- | Get the 'FilePath' corresponding to a 'FilePathRoot'.
--
-- The 'FilePath' argument is required to supply the path for the
-- 'FilePathRelative' case.
--
getFilePathRootDirectory :: FilePathRoot
                         -> FilePath      -- ^ root for relative paths
                         -> IO FilePath
getFilePathRootDirectory  FilePathRelative   root = return root
getFilePathRootDirectory (FilePathRoot root) _    = return root
getFilePathRootDirectory  FilePathHomeDir    _    = getHomeDirectory


------------------------------------------------------------------------------
-- Matching
--

-- | Match a 'FilePathGlob' against the file system, starting from a given
-- root directory for relative paths. The results of relative globs are
-- relative to the given root. Matches for absolute globs are absolute.
--
matchFileGlob :: FilePath -> FilePathGlob -> IO [FilePath]
matchFileGlob relroot (FilePathGlob globroot glob) = do
    root <- getFilePathRootDirectory globroot relroot
    matches <- matchFileGlobRel root glob
    case globroot of
      FilePathRelative -> return matches
      _                -> return (map (root </>) matches)

-- | Match a 'FilePathGlobRel' against the file system, starting from a
-- given root directory. The results are all relative to the given root.
--
matchFileGlobRel :: FilePath -> FilePathGlobRel -> IO [FilePath]
matchFileGlobRel root glob0 = go glob0 ""
  where
    go (GlobFile glob) dir = do
      entries <- getDirectoryContents (root </> dir)
      let files = filter (matchGlob glob) entries
      return (map (dir </>) files)

    go (GlobDir glob globPath) dir = do
      entries <- getDirectoryContents (root </> dir)
      subdirs <- filterM (\subdir -> doesDirectoryExist
                                       (root </> dir </> subdir))
               $ filter (matchGlob glob) entries
      concat <$> mapM (\subdir -> go globPath (dir </> subdir)) subdirs

    go GlobDirTrailing dir = return [dir]


-- | Match a globbing pattern against a file path component
--
matchGlob :: Glob -> String -> Bool
matchGlob = goStart
  where
    -- From the man page, glob(7):
    --   "If a filename starts with a '.', this character must be
    --    matched explicitly."

    go, goStart :: [GlobPiece] -> String -> Bool

    goStart (WildCard:_) ('.':_)  = False
    goStart (Union globs:rest) cs = any (\glob -> goStart (glob ++ rest) cs)
                                        globs
    goStart rest               cs = go rest cs

    go []                 ""    = True
    go (Literal lit:rest) cs
      | Just cs' <- stripPrefix lit cs
                                = go rest cs'
      | otherwise               = False
    go [WildCard]         ""    = True
    go (WildCard:rest)   (c:cs) = go rest (c:cs) || go (WildCard:rest) cs
    go (Union globs:rest)   cs  = any (\glob -> go (glob ++ rest) cs) globs
    go []                (_:_)  = False
    go (_:_)              ""    = False


------------------------------------------------------------------------------
-- Parsing & printing
--

-- instance Text FilePathGlob where
--   disp (FilePathGlob root pathglob) = disp root Disp.<> disp pathglob
--   parse =
--     parse >>= \root ->
--         (FilePathGlob root <$> parse)
--     <++ (when (root == FilePathRelative) Parse.pfail >>
--          return (FilePathGlob root GlobDirTrailing))

-- instance Text FilePathRoot where
--   disp  FilePathRelative    = Disp.empty
--   disp (FilePathRoot root)  = Disp.text root
--   disp FilePathHomeDir      = Disp.char '~' Disp.<> Disp.char '/'

--   parse =
--         (     (Parse.char '/' >> return (FilePathRoot "/"))
--           +++ (Parse.char '~' >> Parse.char '/' >> return FilePathHomeDir)
--           +++ (do drive <- Parse.satisfy (\c -> (c >= 'a' && c <= 'z')
--                                              || (c >= 'A' && c <= 'Z'))
--                   _ <- Parse.char ':'
--                   _ <- Parse.char '/' +++ Parse.char '\\'
--                   return (FilePathRoot (toUpper drive : ":\\")))
--         )
--     <++ return FilePathRelative

-- instance Text FilePathGlobRel where
--   disp (GlobDir  glob pathglob) = dispGlob glob
--                           Disp.<> Disp.char '/'
--                           Disp.<> disp pathglob
--   disp (GlobFile glob)          = dispGlob glob
--   disp  GlobDirTrailing         = Disp.empty

--   parse = parsePath
--     where
--       parsePath :: ReadP r FilePathGlobRel
--       parsePath =
--         parseGlob >>= \globpieces ->
--             asDir globpieces
--         <++ asTDir globpieces
--         <++ asFile globpieces

--       asDir  glob = do dirSep
--                        globs <- parsePath
--                        return (GlobDir glob globs)
--       asTDir glob = do dirSep
--                        return (GlobDir glob GlobDirTrailing)
--       asFile glob = return (GlobFile glob)

--       dirSep = (Parse.char '/' >> return ())
--            +++ (do _ <- Parse.char '\\'
--                    -- check this isn't an escape code
--                    following <- Parse.look
--                    case following of
--                      (c:_) | isGlobEscapedChar c -> Parse.pfail
--                      _                           -> return ())


-- dispGlob :: Glob -> Disp.Doc
-- dispGlob = Disp.hcat . map dispPiece
--   where
--     dispPiece WildCard      = Disp.char '*'
--     dispPiece (Literal str) = Disp.text (escape str)
--     dispPiece (Union globs) = Disp.braces
--                                 (Disp.hcat (Disp.punctuate
--                                              (Disp.char ',')
--                                              (map dispGlob globs)))
--     escape []               = []
--     escape (c:cs)
--       | isGlobEscapedChar c = '\\' : c : escape cs
--       | otherwise           =        c : escape cs

-- parseGlob :: ReadP r Glob
-- parseGlob = Parse.many1 parsePiece
--   where
--     parsePiece = literal +++ wildcard +++ union

--     wildcard = Parse.char '*' >> return WildCard

--     union = Parse.between (Parse.char '{') (Parse.char '}') $
--               fmap Union (Parse.sepBy1 parseGlob (Parse.char ','))

--     literal = Literal `fmap` litchars1

--     litchar = normal +++ escape

--     normal  = Parse.satisfy (\c -> not (isGlobEscapedChar c)
--                                 && c /= '/' && c /= '\\')
--     escape  = Parse.char '\\' >> Parse.satisfy isGlobEscapedChar

--     litchars1 :: ReadP r [Char]
--     litchars1 = liftM2 (:) litchar litchars

--     litchars :: ReadP r [Char]
--     litchars = litchars1 <++ return []

-- isGlobEscapedChar :: Char -> Bool
-- isGlobEscapedChar '*'  = True
-- isGlobEscapedChar '{'  = True
-- isGlobEscapedChar '}'  = True
-- isGlobEscapedChar ','  = True
-- isGlobEscapedChar _    = False

-- Exceptions

-- | Run an IO computation, returning @e@ if it raises a "file
-- does not exist" error.
handleDoesNotExist :: a -> IO a -> IO a
handleDoesNotExist e =
    Exception.handleJust
      (\ioe -> if isDoesNotExistError ioe then Just ioe else Nothing)
      (\_ -> return e)

-- | Writes a file atomically.
--
-- The file is either written successfully or an IO exception is raised and
-- the original file is left unchanged.
--
-- On windows it is not possible to delete a file that is open by a process.
-- This case will give an IO exception but the atomic property is not affected.
--
writeFileAtomic :: FilePath -> BS.ByteString -> IO ()
writeFileAtomic targetPath content = do
  let (targetDir, targetFile) = splitFileName targetPath
  Exception.bracketOnError
    (openBinaryTempFileWithDefaultPermissions targetDir $ targetFile <.> "tmp")
    (\(tmpPath, handle) -> hClose handle >> removeFile tmpPath)
    (\(tmpPath, handle) -> do
        BS.hPut handle content
        hClose handle
        renameFile tmpPath targetPath)

-- | Generic merging utility. For sorted input lists this is a full outer join.
--
mergeBy :: (a -> b -> Ordering) -> [a] -> [b] -> [MergeResult a b]
mergeBy cmp = merge
  where
    merge []     ys     = [ OnlyInRight y | y <- ys]
    merge xs     []     = [ OnlyInLeft  x | x <- xs]
    merge (x:xs) (y:ys) =
      case x `cmp` y of
        GT -> OnlyInRight   y : merge (x:xs) ys
        EQ -> InBoth      x y : merge xs     ys
        LT -> OnlyInLeft  x   : merge xs  (y:ys)

data MergeResult a b = OnlyInLeft a | InBoth a b | OnlyInRight b

-- | Create and use a temporary directory.
--
-- Creates a new temporary directory inside the given directory, making use
-- of the template. The temp directory is deleted after use. For example:
--
-- > withTempDirectory verbosity "src" "sdist." $ \tmpDir -> do ...
--
-- The @tmpDir@ will be a new subdirectory of the given directory, e.g.
-- @src/sdist.342@.
--
-- withTempDirectory :: FilePath -> String -> (FilePath -> IO a) -> IO a
-- withTempDirectory targetDir template f =
--   Exception.bracket
--     (createTempDirectory targetDir template)
--     (handleDoesNotExist () . removeDirectoryRecursive)
--     f
