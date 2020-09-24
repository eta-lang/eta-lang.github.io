{-# OPTIONS_GHC -fno-warn-incomplete-patterns #-}
{-# LANGUAGE DeriveGeneric #-}
module Docs.Gen (genDocs) where

import Data.Monoid((<>))

import Common
import Gen
import GHC.Generics
import System.Directory.Tree (DirTree(..))
import GHC.Exts (sortWith)
import Control.Arrow(second)
import Control.Applicative
import Control.Monad
import Data.Text (Text)
import Data.Char (isAlphaNum)
import Data.ByteString (ByteString)
import Data.Maybe
import Data.Binary
import Data.List
import Data.List.Zipper
import Data.List.Split
import System.FilePath
import Docs.Markdown
import qualified Text.XmlHtml as X
import qualified Data.Map as M
import qualified Data.Text as T
import qualified System.Directory.Tree as D

type ModuleLessonsInfo = [((Text, Text, Text), [(Text, Text)])]

type WithHole3 a = (Text, Text, Text, Text)
                -> ModuleLessonsInfo
                -> (Text, Text)
                -> Rebuild a
type WithHole2 a = ModuleLessonsInfo
                -> (Text, Text)
                -> Rebuild a

genDocs :: FilePath -> FilePath -> DirTree FilePath -> Rebuild RenderMap
genDocs templatesPath docsPath (Dir _topLevel topContents) = do
  (indexBody, ms) <- goSections templatesPath docsPath topContents
  return $ M.singleton [""] indexBody <> ms

goSections :: FilePath -> FilePath -> [DirTree FilePath] -> Rebuild (ByteString, RenderMap)
goSections templatesPath docsPath contents = do
  let (files, dirs) = partitionDirTree contents
      (intro:_, _) = partition (\f -> D.name f == "intro.md") files
  (intros, ms) <- fmap unzip $ mapM (goModules templatesPath docsPath) dirs
  intro'       <- parseIntroSimple (D.file intro)
  indexHtml    <- renderDocIndex templatesPath docsPath intro' intros
  return (indexHtml, mconcat ms)

renderDocIndex :: FilePath -> FilePath -> Intro -> [Intro] -> Rebuild ByteString
renderDocIndex templatesPath docsPath intro intros =
  rerunIfChanged (newCacheFilePathMonitor docsPath) (intro, intros) $ do
    liftIO $ putStrLn $ "Rendering index page " ++ docsPath
    monitorFiles $ map (monitorTemplate templatesPath)
      ["docs-sections", "main-header", "main-footer"]
    liftIO $ withHeist 1 $ loadAndRenderTemplate templatesPath "docs-sections" mempty $ do
      "mainHeader"       ## withAttributes ("headerLogo" ## iconAttr docsLogo)
                                           (inlineTemplate templatesPath "main-header")
      "mainFooter"       ## inlineTemplate templatesPath "main-footer"
      "indexTitle"       ## textSplice (introTitle intro)
      "indexDescription" ## textSplice (introDescription intro)
      "sections"         ## sectionsSplice
  where sectionsSplice = do
          withTemplate templatesPath "docs-index-row" $ \template -> do
            rows <- forM (chunksOf 2 intros) $ \(l:r:_) ->
              withAttributes (do
                "leftIcon"  ## introIconAttr l
                "leftHref"  ## hrefAttr l
                "rightIcon" ## introIconAttr r
                "rightHref" ## hrefAttr r) $
                callTemplateWithText template $ do
                  "leftTitle"        ## introTitle       l
                  "leftDescription"  ## introDescription l
                  "rightTitle"       ## introTitle       r
                  "rightDescription" ## introDescription r
            return $ concat rows
        hrefAttr i _t = return [("href", introLink i)]
        -- imgAttr  i _t = return [("alt", introTitle i), ("src", introIcon i)]

parseIntroSimple :: FilePath -> Rebuild Intro
parseIntroSimple path =
  rerunIfChanged (newCacheFilePathMonitor path) () $ do
    liftIO $ putStrLn $ "Processing intro " ++ path
    monitorFiles [monitorFileHashed path]
    blocks' <- liftIO $ parseMarkdown path
    let (BlockHeading _ [InlineText introTitle]
         :(BlockPara [InlineImage {}])
         :(BlockPara [InlineText introDescription]):_)
          = map (fmap concat) blocks'
    return $ IntroSimple {..}

goModules :: FilePath -> FilePath -> DirTree FilePath -> Rebuild (Intro, RenderMap)
goModules templatesPath docsPath (Dir dirName contents) = do
  let (files, dirs)      = partitionDirTree contents
      (intro:_, _files') = partition (\f -> D.name f == "intro.md") files
      section            = snd $ numPrefix dirName
      sectionPiece       = T.pack section
      modulesPath        = docsPath </> dirName
      parentSections     = getParentSections docsPath
  introInfo  <- parseIntro parentSections section (D.file intro)
  mIntrosMs  <- case introType introInfo of
                  IntroModules -> fmap (Just . unzip) $
                    mapM (goLessons templatesPath modulesPath) dirs
                  _ -> return Nothing
  (indexBody, ms) <- renderModulesIndex mIntrosMs templatesPath modulesPath contents
                     introInfo
  return (introInfo, M.insert [sectionPiece] indexBody
                   $ M.mapKeys ((++) [sectionPiece]) ms)

renderModulesIndex :: Maybe ([Intro], [[WithHole2 RenderMap]])
                   -> FilePath -> FilePath -> [DirTree FilePath] -> Intro
                   -> Rebuild (ByteString, RenderMap)
renderModulesIndex (Just (intros, ms)) templatesPath modulesPath _contents sectionIntro =
  rerunIfChanged (newCacheFilePathMonitor modulesPath) (sectionIntro, intros) $ do
    liftIO $ putStrLn $ "Rendering index page" ++ modulesPath
    monitorFiles $ map (monitorTemplate templatesPath)
      ["docs-modules", "main-header", "main-footer", "docs-module-row"]
    indexBody <- liftIO $ withHeist 2 $
      loadAndRenderTemplate templatesPath "docs-modules" mempty
        (do "mainHeader" ## withAttributes ("headerLogo" ## iconAttr docsLogo)
                                          (inlineTemplate templatesPath "main-header")
            "mainFooter" ## inlineTemplate templatesPath "main-footer"
            "modules"           ## modulesSplice
            "moduleTitle"       ## textSplice (introTitle sectionIntro)
            "moduleDescription" ## textSplice (introDescription sectionIntro))
    let moduleLessonIndex =
          map (\IntroModule{..} -> ((introTitle, introIcon, ""), introIndex)) intros
    finalMap <- fmap (M.unions . concat) $
      mapM (mapM (\f -> f moduleLessonIndex (introTitle sectionIntro,
                                            introLink sectionIntro))) ms
    return (indexBody, finalMap)
  where modulesSplice = do
          withTemplate templatesPath "docs-module-row" $ \template -> do
            rows <- forM intros $ \i@IntroModule {..} -> do
              withAttributes ("introIcon" ## introIconAttr i) $
                callTemplate template $ do
                  "introTitle"        ## textSplice introTitle
                  "introDescription"  ## textSplice introDescription
                  "introIndex"        ## indexSplice introIndex
            return $ concat rows
        indexSplice introIndex =
          return [X.Element "ul" [] $
            map (\(title, link) ->
                   X.Element "li" []
                   [X.Element "a" [("href", link)]
                    [X.TextNode title]])
            introIndex]

renderModulesIndex Nothing templatesPath modulesPath contents sectionIntro = do
  case introType sectionIntro of
    IntroRecursive -> goSections templatesPath modulesPath contents
    _ -> rerunIfChanged (newCacheFilePathMonitor modulesPath) () $ do
      liftIO $ putStrLn $ "Rendering index page" ++ modulesPath
      monitorFiles $ monitorTemplate modulesPath "index"
                   : map (monitorTemplate templatesPath) ["main-header", "main-footer"]
      indexBody <- liftIO $ withHeist 4 $
        loadAndRenderTemplate modulesPath "index" mempty $ do
          "mainHeader" ## withAttributes ("headerLogo" ## iconAttr docsLogo)
                                        (inlineTemplate templatesPath "main-header")
          "mainFooter" ## inlineTemplate templatesPath "main-footer"
      return (indexBody, mempty)

parseIntro :: [String] -> String -> FilePath -> Rebuild Intro
parseIntro parentSections section path =
  rerunIfChanged (newCacheFilePathMonitor path) (parentSections, section) $ do
    liftIO $ putStrLn $ "Processing intro " ++ path
    monitorFiles [monitorFileHashed path]
    blocks' <- liftIO $ parseMarkdown path
    let [BlockHeading _ [InlineText introTitle]
         ,(BlockPara [InlineImage introIcon _ _])
         ,(BlockPara [InlineText introDescription])
         ,(BlockReference _type introType')]
          = map (fmap concat) blocks'
        introType = parseIntroType introType'
        introLink = "/docs/" <> T.pack (concatMap (++ "/") parentSections)
                <> T.pack section
    return $ Intro {..}

goLessons :: FilePath -> FilePath -> DirTree FilePath -> Rebuild (Intro, [WithHole2 RenderMap])
goLessons templatesPath modulesPath (Dir dirName contents) = do
  let (files, _dirs)     = partitionDirTree contents
      (intro:_, files')  = partition (\f -> D.name f == "intro.md") files
      sections           = getParentSections modulesPath
      moduleName         = snd $ numPrefix dirName
      modulePiece        = T.pack moduleName
      -- lessonsPath        = modulesPath </> dirName
  (lessonIntros, genLessons) <- fmap unzip $ mapM (goLessonContents templatesPath) files'
  intro <- parseIntroModule sections moduleName (D.file intro) lessonIntros
  return (intro,
          map (\f ->
                 \a b -> fmap (M.mapKeys ((++) [modulePiece]))
                       -- TODO: Handle module link
                       $ f (introTitle intro, introDescription intro,
                            introIcon intro, "") a b) genLessons)

goLessonContents :: FilePath -> DirTree FilePath -> Rebuild ((Text, Text), WithHole3 RenderMap)
goLessonContents templatesPath (D.File fileName filePath) = liftIO $ do
  let lesson = dropExtension (snd $ numPrefix fileName)
      lessonPiece = T.pack lesson
  (headerBlock:mainBlocks) <- parseMarkdownFull filePath
  let (BlockHeading _ [InlineText lessonTitle]) = headerBlock
      splitSubLessons bs (b@(BlockHeading 2 _):rest)
        | null bs   = splitSubLessons [b] rest
        | otherwise = reverse bs : splitSubLessons [b] rest
      splitSubLessons bs (b:rest) = splitSubLessons (b:bs) rest
      splitSubLessons bs [] = [reverse bs]
      subLessons = splitSubLessons [] mainBlocks
      subLessonHeaders =
        map
        (\((BlockHeading _ [InlineText title]):_) -> (title, clean title))
        subLessons
      isValidChar c = isAlphaNum c || isInfixOf [c] "-_:."
      clean = T.filter isValidChar . T.replace " " "-" . T.toLower
      genLesson modInfo@(moduleTitle, moduleDescription, moduleIcon, moduleLink)
                moduleLessonInfo
                secInfo@(sectionTitle, sectionLink) =
        rerunIfChanged (newCacheFilePathMonitor filePath)
                       (modInfo, moduleLessonInfo, secInfo, otherStyles) $ do
          liftIO $ putStrLn $ "Rendering lesson " ++ filePath
          let (mPrevLink, mNextLink) =
                findAdjacentLessons moduleLessonInfo moduleTitle lessonTitle
          monitorFiles $ monitorFileHashed filePath :
            map (monitorTemplate templatesPath)
            ["docs-lesson", "main-header", "docs-lesson-body"]
          lessonBody <- liftIO $ withHeist 3 $
              loadAndRenderTemplate templatesPath "docs-lesson"
                (do "prevLink" ## hrefAttr mPrevLink
                    "nextLink" ## hrefAttr mNextLink)
                (do "mainHeader"        ##
                      withAttributes ("headerLogo" ## iconAttr docsLogo)
                                    (inlineTemplate templatesPath "main-header")
                    "sidenav"           ## sidenavSplice
                    "tocModuleImg"      ## tocModuleImgSplice
                    "tocBreadcrumbs"    ## tocBreadcrumbsSplice
                    "lessonTitle"       ## textSplice lessonTitle
                    "toc"               ## tocSplice
                    "lesson"            ## lessonSplice
                    "moduleTitle"       ## textSplice moduleTitle
                    "moduleDescription" ## textSplice moduleDescription)
          return $ M.singleton [lessonPiece] lessonBody
        where sidenavSplice =
                return $ map (\((moduleTitle', moduleIcon, moduleLink), lessonsIndex) ->
                                X.Element "li"
                                 [("style", T.concat ["background: url('"
                                                     , moduleIcon
                                                     ,"') no-repeat left top;"
                                                     , otherStyles
                                                     ])]
                                  -- TODO: Handle moduleLink
                                  [X.Element "a" [("href", moduleLink) | not (T.null moduleLink)]
                                   [X.TextNode moduleTitle']
                                   ,X.Element "ul" [("class", "assignments" <>
                                                      (if moduleTitle' == moduleTitle
                                                       then ""
                                                       else " hide"))] $
                                    map (\(title, link) ->
                                           X.Element "li" []
                                           [X.Element "a" [("href", link)]
                                            [X.TextNode title]]) lessonsIndex])
                         moduleLessonInfo
              otherStyles = "background-size: 28px 28px;\
                            \background-position: 5px 15px;\
                            \padding-left: 44px;\
                            \padding-top: 4px;"
              tocModuleImgSplice =
                return [X.Element "img" [("src", moduleIcon)
                                        ,("alt", moduleTitle)
                                        ,("class", "header-image")] []]
              tocBreadcrumbsSplice =
                return [X.Element "li" []
                        [X.Element "a" [("href", sectionLink)]
                         [X.TextNode sectionTitle]]
                       ,X.Element "li" []
                        [X.Element "a" [("href", moduleLink)]
                         [X.TextNode moduleTitle]]]

              tocSplice =
                return $ map (\(subLessonTitle, subLessonRef) ->
                                X.Element "li" []
                                [X.Element "a" [("href", "#" <> subLessonRef)]
                                 [X.TextNode subLessonTitle]])
                         subLessonHeaders

              lessonSplice =
                withTemplate templatesPath "docs-lesson-body" $ \template -> do
                  rows <- forM subLessons $
                    \((BlockHeading _ [InlineText subLessonTitle])
                      :subLessonBlocks) -> do
                      let subLessonBodySplice =
                            liftIO $ renderBlocks subLessonBlocks
                      withAttributes (do "subLessonId" ## idSplice subLessonTitle
                                         "subLessonHref" ## hrefSplice subLessonTitle) $
                        callTemplate template $ do
                          "subLessonTitle" ## textSplice subLessonTitle
                          "subLessonBody"  ## subLessonBodySplice
                  return $ concat rows
                  where idSplice t _ = return [("id", clean t)]
                        hrefSplice t _ = return [("href", "#" <> clean t)]

              findAdjacentLessons moduleLessonInfo moduleTitle lessonTitle
                = (mdLeftLesson  <|> fmap (snd . last) mLeftModule
                  ,mdRightLesson <|> fmap (snd . head) mRightModule)
                where (mLeftModule, lessonIndex, mRightModule) =
                        findAdjacents (\((mt,_,_),_) -> mt == moduleTitle)
                          snd moduleLessonInfo
                      (mdLeftLesson, _, mdRightLesson) =
                        findAdjacents (\(t,_) -> t == lessonTitle) snd lessonIndex

  return ((lessonTitle, T.pack lesson), genLesson)


parseIntroModule :: [String] -> String -> FilePath -> [(Text, Text)] -> Rebuild Intro
parseIntroModule sections moduleName path lessonTitleLinks =
  rerunIfChanged (newCacheFilePathMonitor path) (sections, moduleName,
                                                 lessonTitleLinks) $ do
    liftIO $ putStrLn $ "Processing intro " ++ path
    monitorFiles [monitorFileHashed path]
    blocks' <- liftIO $ parseMarkdown path
    let [BlockHeading _ [InlineText introTitle]
          ,(BlockPara [InlineImage introIcon _ _])
          ,(BlockPara [InlineText introDescription])]
          = map (fmap concat) blocks'
        introIndex =
          map (second (mappend ("/docs/" <> (T.pack (concatMap (++ "/") sections))
                                <> T.pack moduleName <> "/")))
            lessonTitleLinks
    return $ IntroModule {..}

data Intro =
    IntroSimple { introTitle       :: Text
                , introDescription :: Text }
 |  Intro { introTitle       :: Text
          , introIcon        :: Text
          , introDescription :: Text
          , introType        :: IntroType
          , introLink        :: Text }
  | IntroModule { introTitle       :: Text
                , introIcon        :: Text
                , introDescription :: Text
                , introIndex       :: [(Text, Text)] } -- (Title, Link)
  deriving (Eq, Show, Generic)

instance Binary Intro

data IntroType = IntroRecursive | IntroModules | IntroDirect
  deriving (Eq, Show, Generic)

instance Binary IntroType

parseIntroType :: Text -> IntroType
parseIntroType t = case t of
  "recursive" -> IntroRecursive
  "modules" -> IntroModules
  "direct"  -> IntroDirect
  _         -> error $ "Invalid intro type: " ++ T.unpack t

introIconAttr :: (Monad m) => Intro -> AttrSplice m
introIconAttr i = \_ -> return [("alt", introTitle i), ("src", introIcon i)]

partitionDirTree :: [DirTree a] -> ([DirTree a], [DirTree a])
partitionDirTree = go [] []
  where go fs ds (tree:trees) =
          case tree of
            D.File   {} -> go (tree:fs) ds trees
            Dir    {} -> go fs (tree:ds) trees
            Failed {} -> go fs ds trees
        go fs ds [] = (sort' fs, sort' ds)
        sort' = sortWith (fst . numPrefix . D.name)

numPrefix :: String -> (Int, String)
numPrefix dir =
  case reads dir of
    ((i,rest):_) -> ( i, drop 1 rest)
    []           -> (-1, "")

getParentSections :: String -> [String]
getParentSections filePath =
  mapMaybe (\dir ->
              case numPrefix dir of
                (n, sec) | n == -1 -> Nothing
                         | otherwise -> Just sec)
  $ splitDirectories filePath

hrefAttr :: (Monad m) => Maybe T.Text -> AttrSplice m
hrefAttr mText
  | Just t <- mText
  = const $ return [("href", t)]
  | otherwise = const $ return [("class", "hide")]

findAdjacents :: (a -> Bool) -> (a -> b) -> [a] -> (Maybe b, b, Maybe b)
findAdjacents p f xs = go p f (fromList xs)
  where go p f zipper
          | Just a <- safeCursor zipper
          , p a
          = (if beginp zipper
             then Nothing
             else fmap f $ safeCursor (left zipper),
              f a,
              fmap f $ safeCursor (right zipper))
          | otherwise = go p f (right zipper)
