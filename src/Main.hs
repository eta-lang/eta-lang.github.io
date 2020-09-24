module Main where

import Common
import Gen
import Docs.Gen
import Web.Gen
import Control.Monad(void)
import System.Directory (createDirectoryIfMissing)
import System.FilePath
import GHC.IO.Encoding
import qualified Data.Text as T
import qualified Data.Map as Map
import qualified Data.ByteString as BS

main :: IO ()
main = do
  createDirectoryIfMissing True cacheRoot
  createDirectoryIfMissing True wwwRoot
  setLocaleEncoding utf8
  webStore  <- newRenderCache
  docsStore <- newRenderCache
  runRebuild "." $ do
    renderDocs docsStore templatesRoot docsRoot
    renderWeb  webStore  templatesRoot staticRoot 
  let _mainNotFound = render404 templatesRoot notFound mainLogo
  let _docsNotFound = render404 templatesRoot notFound docsLogo
  index <- readRenderCache webStore
  void $ flip Map.traverseWithKey index $ \pathPieces file -> do
    let pieces = map T.unpack pathPieces
        path = wwwRoot </> foldl1 (</>) pieces
        dir = takeDirectory path
    print (path, dir)
    createDirectoryIfMissing True dir
    BS.writeFile path file
  print $ Map.keys index
  index <- readRenderCache docsStore
  void $ flip Map.traverseWithKey index $ \pathPieces file -> do
    let pieces = map T.unpack pathPieces
        path' = wwwRoot </> "docs" </> foldl1 (</>) pieces
        path
          | takeExtension path' == "" = path' <.> "html"
          | otherwise = path'
        dir = takeDirectory path
    print (path, dir)
    createDirectoryIfMissing True dir
    BS.writeFile path file
  print $ Map.keys index

renderWeb :: RenderCache -> FilePath -> FilePath -> Rebuild ()
renderWeb store templatesPath webPath =
  renderWith store webPath $ genWeb templatesPath webPath

renderDocs :: RenderCache -> FilePath -> FilePath -> Rebuild ()
renderDocs store templatesPath docsPath =
  renderWith store docsPath $ genDocs templatesPath docsPath