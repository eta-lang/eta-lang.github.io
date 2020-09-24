{-# LANGUAGE TupleSections #-}
module Docs.Markdown (
  parseMarkdown,
  parseMarkdownFull,
  renderBlocks,
  module Text.Markdown.Block,
  module Text.Markdown.Inline
  ) where

import Text.Markdown
import Text.Markdown.Block
import Text.Markdown.Inline
import Data.Functor.Identity (runIdentity)
import Data.List
import Data.Monoid
import Data.Maybe
import Data.Conduit
import Control.Monad
import qualified Data.Map as Map
import qualified Data.Text as T
import qualified Data.Text.IO as T
import qualified Data.Text.Encoding as T
import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.IO as TL
import qualified Text.XmlHtml as X
import qualified Data.Conduit.List as CL
import Turtle hiding (FilePath)

parseMarkdown :: FilePath -> IO [Block [[Inline]]]
parseMarkdown path = do
  tl <- TL.readFile path
  let blocks = runIdentity $ CL.sourceList (TL.toChunks tl)
                             $$ toBlocks def
                             =$ CL.consume
      refs = Map.unions $ map toRef blocks

      toRef (BlockReference x y) = Map.singleton x y
      toRef _ = Map.empty

      blockInlines = map (fmap (map (toInline refs)) . toBlockLines) blocks

  return blockInlines

parseMarkdownFull :: FilePath -> IO [Block [Inline]]
parseMarkdownFull path =
  map (fmap $ intercalate [InlineHtml "<br>"]) <$> parseMarkdown path

breakElement :: X.Node
breakElement = X.Element "br" [] []

renderBlocks :: [Block [Inline]] -> IO [X.Node]
renderBlocks = fmap (removeTrailingBreakElement . collapseBreakElements) . renderBlocks'

renderBlocks' :: [Block [Inline]] -> IO [X.Node]
renderBlocks' = go []
  where
        go nodess (x:xs) =
          case x of
            BlockPara is -> do
              children <- recIs is
              recGo [X.Element "p" [] children, breakElement]
            BlockPlainText is -> recGo =<< recIs is
            b@(BlockList listType _eBlocks) -> do
              let (elements, rest) = span (\case
                                              BlockList listType' _
                                                | listType' == listType -> True
                                              _ -> False) xs
                  typ = case listType of
                          Ordered   -> "ol"
                          Unordered -> "ul"
              listNodes <- mapM (\(BlockList _ eBlocks) ->
                                   X.Element "li" [] <$>
                                     either recIs renderBlocks' eBlocks) (b:elements)
              go (singleton
                  (X.Element typ [("class", "bullet-list pl--20 pb--20")]
                   listNodes) : nodess) rest
            BlockHtml t -> recGo (htmlToNodes t)
            BlockCode mLang code -> recGo =<< generateCode mLang code
            BlockQuote bs -> recGo =<<
              fmap (singleton . X.Element "blockquote" []) (renderBlocks bs)
            BlockRule -> recGo [X.Element "hr" [] []]
            -- TODO: Customize
            BlockHeading level is -> do

              let (tag, class') =
                    case level of
                      1 -> ("h3", "heading--medium mb--20 color--purple")
                      2 -> ("h3", "heading--medium mb--20 color--purple")
                      3 -> ("h3", "heading--small mb--20")
                      _ -> ("h4", "heading--small")
              recGo =<< fmap (singleton . X.Element tag [("class", class')]) (recIs is)
            BlockReference {} -> recGo []
            BlockTable headerAlignments rows -> do
              let (aligns', hyphenLengths, headers) = unzip3 headerAlignments
                  headerAligns = firstAlign
                               : replicate (length middleAligns) AlignDefault ++ [lastAlign]
                  middleAligns = tail (init aligns')
                  aligns = firstAlign : middleAligns ++ [lastAlign]
                  firstAlign
                    | AlignDefault <- align = AlignLeft
                    | otherwise = align
                    where align = head aligns'
                  lastAlign
                    | AlignDefault <- align = AlignRight
                    | otherwise = align
                    where align = last aligns'
                  alignAttr AlignLeft    = Just "left"
                  alignAttr AlignRight   = Just "right"
                  alignAttr AlignCenter  = Just "center"
                  alignAttr AlignDefault = Nothing
                  alignAttribute = maybe [] (singleton . ("align",)) . alignAttr
                  numColumns = length headerAligns
                  totalWidth
                    | numColumns > 2 = 100
                    | otherwise = 60
                  totalHyphenLength = sum hyphenLengths
              headerColumns <- forM (zip3 headerAligns hyphenLengths headers) $ \(align, hyphenLength, header) -> do
                let columnWidth = totalWidth * ((fromIntegral hyphenLength :: Double)
                                               / fromIntegral totalHyphenLength)
                    widthAttribute = ("width", T.pack (show columnWidth) <> "%")
                fmap (X.Element "td" (widthAttribute : alignAttribute align)) $ recIs header
              let thead = X.Element "thead" [] [X.Element "tr" [] headerColumns]
              rowColumns <- forM rows $ \row ->
                fmap (X.Element "tr" []) $
                  forM (zip aligns row) $ \(align, column) -> do
                    elems <- recIs column
                    return $ X.Element "td" (alignAttribute align) elems
              let tbody = X.Element "tbody" [] rowColumns
              recGo [X.Element "table" [("class", "markdown-table")] [thead, tbody]
                    ,X.Element "br" [] []]
            where recGo nodes = go (nodes : nodess) xs
                  recIs is = do
                    is' <- mapM goI is
                    return $ removeTrailingBreakElement is'
        go nodess [] = return . concat $ reverse nodess

        goI (InlineText t)    = return $ X.TextNode t
        goI (InlineItalic is) = X.Element "i" [] <$> mapM goI is
        goI (InlineBold is)   = X.Element "span" [("class", "text--bold pb--20")] <$> mapM goI is
        -- TODO: Make actual code here!
        goI (InlineCode t) = return $ X.Element "span" [("class", "inline-code")] [X.TextNode t]
        goI (InlineLink url _mtitle is) =
          X.Element "a" [("href", url), ("target", "_blank")] <$> mapM goI is
        goI (InlineImage url mtitle content) =
          return $ X.Element "img" ([("src", url), ("alt", content)] ++
                                    [("title", title) | let Just title = mtitle]) []
        goI (InlineHtml t) = return $ X.Element "div" [] $ htmlToNodes t
        goI (InlineFootnoteRef x) =
          let ishown = T.pack (show x)
              (<>) = mappend
          in return $
               X.Element "a"
               [("href", "#footnote-" <> ishown), ("id", "ref-" <> ishown)]
               [X.TextNode $ "[" <> ishown <> "]"]
        goI (InlineFootnote x) =
          let ishown = T.pack (show x)
              (<>) = mappend
          in return $
               X.Element "a" [("href", "#ref-" <> ishown),
                              ("id", "footnote-" <> ishown)]
               [X.TextNode $ "[" <> ishown <> "]"]

htmlToNodes :: Text -> [X.Node]
htmlToNodes t = either error X.docContent
              . X.parseHTML ("renderBlocks:\n" <> T.unpack t)
              $ T.encodeUtf8 t

singleton :: a -> [a]
singleton x = [x]

generateCode :: Maybe Text -> Text -> IO [X.Node]
generateCode mLang code = do
  html <- pygmentize mLang code
  return $ htmlToNodes html ++ [breakElement]

pygmentize :: Maybe Text -> Text -> IO Text
pygmentize mLang code = do
  let linenos
        | Just l <- mLang
        , let s = T.unpack l
        , s `elem` ["console", "shell", "sh"]
        = ""
        | Nothing <- mLang
        = ""
        | otherwise = "-O linenos=table"
  runShellWithInput ("pygmentize -f html " <> linenos <>
                     (fromMaybe mempty $ fmap (" -l " <> ) mLang))
              . select $ textToLines code

runShellWithInput :: Text -> Shell Line -> IO Text
runShellWithInput cmd inShell = do
  (exitCode, out, err) <- shellStrictWithErr cmd inShell
  case exitCode of
    ExitSuccess -> return out
    ExitFailure n -> do
      T.putStrLn $ "The shell command \"" <> cmd <> "\" failed."
      T.putStrLn err
      error $ "ExitCode " ++ show n

removeTrailingBreakElement :: [X.Node] -> [X.Node]
removeTrailingBreakElement is
  | not (null is) && last is == breakElement = init is
  | otherwise = is

collapseBreakElements :: [X.Node] -> [X.Node]
collapseBreakElements = go []
  where go xs [] = xs
        go xs es =
          go (xs ++ nonBreakEs ++ (if null breakEs then [] else [breakElement])) rest
          where (nonBreakEs, breakEs') = break (== breakElement) es
                (breakEs, rest) = span (== breakElement) breakEs'
