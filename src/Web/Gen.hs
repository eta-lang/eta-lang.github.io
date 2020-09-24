module Web.Gen (genWeb) where

import Common
import Gen
import Data.Foldable
import System.FilePath
import qualified Data.Text as T
import qualified Data.Map as M
import qualified Data.ByteString as BS

genWeb :: FilePath -> FilePath -> DirTree FilePath -> Rebuild RenderMap
genWeb templatesPath webPath dirContents =
  rerunIfChanged (newCacheFileMonitor "web") () $ do
    monitorFiles [monitorDirectory webPath]
    ms <- traverse
      (\file ->
         rerunIfChanged (newCacheFilePathMonitor file) () $ do
           monitorFiles [monitorFileHashed file]
           liftIO $ putStrLn $ "Processing " ++ file ++ "..."
           let ext = takeExtension file
               logo
                 | "contribute" `elem` splitDirectories (dropExtension file)
                 = contribLogo
                 | otherwise = mainLogo
               renderFile
                 | ext == ".tpl" = do
                   monitorFiles $ map (monitorTemplate templatesPath)
                                      ["main-header", "main-footer"]
                   liftIO $ withHeist 5 $
                     loadAndRenderTemplate
                       (takeDirectory file) (dropExtension $ takeFileName file)
                       mempty
                       (do "mainHeader" ##
                              withAttributes ("headerLogo" ## iconAttr logo)
                                (inlineTemplate templatesPath "main-header")
                           "mainFooter" ##
                              inlineTemplate templatesPath "main-footer")
                 | otherwise = liftIO $ BS.readFile file
           contents <- renderFile
           return $ M.singleton (pathToPieces (makeRelative webPath file))
                                 contents)
      dirContents
    return $ fold ms

pathToPieces :: FilePath -> Pieces
pathToPieces path = map T.pack $ dirs' ++ [file']
  where dirs = splitDirectories path
        (dirs', file) = (init dirs, last dirs)
        file'
          | takeExtension file `elem` [".html",".tpl"]
          = file -<.> "html"
          | otherwise = file
