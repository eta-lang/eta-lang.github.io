{-# OPTIONS_GHC -fno-warn-orphans #-}
module Common (RenderCache,
               newRenderCache,
               readRenderCache,
               writeRenderCache,
               renderWith,
               Pieces,
               RenderMap,
               DirTree,
               Rebuild,
               runRebuild,
               mainLogo,
               docsLogo,
               contribLogo,
               docsRoot,
               templatesRoot,
               staticRoot,
               notFound,
               wwwRoot,
               cacheFile,
               cacheRoot,
               newCacheFileMonitor,
               newCacheFilePathMonitor,
               monitorTemplate,
               monitorFiles,
               monitorDirectory,
               monitorFileHashed,
               rerunIfChanged,
               liftIO,
              ) where

import Data.IORef
import Data.Text (Text)
import Data.Map.Strict (Map)
import Data.ByteString (ByteString)
import System.Directory.Tree hiding (File)
import System.FilePath ((</>),(<.>), takeFileName)
import Rebuild.FileMonitor
import Rebuild.Monad
import Control.Monad.IO.Class (liftIO)
import qualified Data.Hashable as SimpleHash

newtype RenderCache = RenderCache (IORef RenderMap)

type Pieces = [Text]
type RenderMap = Map Pieces ByteString

newRenderCache :: IO RenderCache
newRenderCache = fmap RenderCache $ newIORef mempty

readRenderCache :: RenderCache -> IO RenderMap
readRenderCache (RenderCache ref) = readIORef ref

writeRenderCache :: RenderCache -> RenderMap -> IO ()
writeRenderCache (RenderCache ref) m = writeIORef ref m

renderWith :: RenderCache -> FilePath -> (DirTree FilePath -> Rebuild RenderMap) -> Rebuild ()
renderWith cache path f = do
  adirTree <- liftIO $ readDirectoryWith return path
  rc <- rerunIfChanged (newCacheFilePathMonitor path) () $ do
    monitorFiles [monitorDirectory path]
    f (dirTree adirTree)
  liftIO $ do
    writeRenderCache cache rc
    putStrLn $ "Finished rendering " ++ path

mainLogo :: FilePath
mainLogo = "/images/eta-logo.svg"

docsLogo :: FilePath
docsLogo = "/images/eta-logo-docs.svg"

contribLogo :: FilePath
contribLogo = "/images/eta-logo-contribute.svg"

cacheRoot :: FilePath
cacheRoot = "cache"

cacheFile :: String -> FilePath
cacheFile file = cacheRoot </> file

docsRoot :: FilePath
docsRoot = "docs"

templatesRoot :: FilePath
templatesRoot = "templates"

staticRoot :: FilePath
staticRoot = "static"

wwwRoot :: FilePath
wwwRoot = "www"

notFound :: FilePath
notFound = "not-found"

newCacheFileMonitor :: (Eq a) => String -> FileMonitor a b
newCacheFileMonitor file = newFileMonitor $ cacheFile file

monitorTemplate :: FilePath -> String -> MonitorFilePath
monitorTemplate path file = monitorFileHashed $ path </> file <.> "tpl"

newCacheFilePathMonitor :: (Eq a) => FilePath -> FileMonitor a b
newCacheFilePathMonitor file =
  newCacheFileMonitor (takeFileName file ++ "-" ++ show (SimpleHash.hash file))
