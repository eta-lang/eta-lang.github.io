module Gen (withHeist,
            withTemplate,
            withAttributes,
            inlineTemplate,
            iconAttr,
            loadAndRenderTemplate,
            render404,
            module Heist,
            module Heist.Interpreted,
            module Data.Map.Syntax
            ) where

import System.FilePath
import Lens.Family2
import Heist
import Heist.Interpreted
import Control.Monad.IO.Class
import Data.ByteString (ByteString)
import Data.ByteString.Builder
import Data.Map.Syntax
import qualified Data.Text as T
import qualified Text.XmlHtml as X
import qualified Data.ByteString.Lazy as BL
import qualified Data.ByteString.Char8 as BC

withHeist :: (MonadIO m) => Int -> (HeistState m -> m ByteString) -> m ByteString
withHeist code f = do
  eHeistState <- liftIO $ initHeist config
  case eHeistState of
    Left errors -> liftIO $ do
      putStrLn $ unlines $ "initHeist: ERROR" : errors
      return $ BC.pack $ "ERROR CODE " ++ show code ++ ": Check server logs."
    Right hs -> f hs
  where config = emptyHeistConfig & hcNamespace .~ ""

withTemplate :: (MonadIO n) => FilePath -> String -> (ByteString -> HeistT m n a) -> HeistT m n a
withTemplate templatesPath template f = do
  let template' = BC.pack template
  (path, nodes) <- liftIO $ loadTemplateNodes templatesPath template
  localHS (addTemplate template' nodes (Just path)) $
    f template'

loadTemplateNodes :: FilePath -> String -> IO (FilePath, Template)
loadTemplateNodes templatesPath template = liftIO $ do
  let path = templatesPath </> template <.> "tpl"
  eDF <- getDoc path
  either (\l -> error $ path ++ " doesn't exist.\n" ++ l)
         (\df -> return (path, X.docContent (dfDoc df)))
         eDF

loadAndRenderTemplate :: (MonadIO m) => FilePath -> String -> Splices (AttrSplice m)
                      -> Splices (Splice m) -> HeistState m -> m ByteString
loadAndRenderTemplate dirPath template' attrSplices splices hs = do
  let template = BC.pack template'
  (path, indexNodes) <- liftIO $ loadTemplateNodes dirPath template'
  Just (builder, _)  <- renderTemplate
    (addTemplate template indexNodes (Just path)
      . bindAttributeSplices attrSplices
      $ bindSplices splices hs) template
  return . BL.toStrict $ toLazyByteString builder

inlineTemplate :: FilePath -> String -> Splice IO
inlineTemplate templatesPath template =
  withTemplate templatesPath template $ flip callTemplate mempty

withAttributes :: Splices (AttrSplice IO) -> Splice IO -> Splice IO
withAttributes splices action = localHS (bindAttributeSplices splices) action

iconAttr :: (Monad m) => FilePath -> AttrSplice m
iconAttr i = const $ return [("src", T.pack i)]

render404 :: FilePath -> FilePath -> (FilePath -> IO ByteString)
render404 templatesPath template logo =
  withHeist 1 $ loadAndRenderTemplate templatesPath template mempty $ do
    "mainHeader" ## withAttributes ("headerLogo" ## iconAttr logo)
                                   (inlineTemplate templatesPath "main-header")
    "mainFooter" ## inlineTemplate templatesPath "main-footer"
