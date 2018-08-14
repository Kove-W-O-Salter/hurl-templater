
module System.IO.Hurl.Parser (
  parse,
  hurl) where

import Control.Monad
import System.IO.Hurl.Data
import Text.ParserCombinators.Parsec

hurl :: Parser [FileTree]
hurl = many fileTree

fileTree :: Parser FileTree
fileTree = leaf <|> node

leaf :: Parser FileTree
leaf =
  do spaces
     string "leaf"
     spaces
     n <- name
     spaces
     char '='
     spaces
     c <- leafContent
     spaces
     return $ Leaf n c

leafContent :: Parser String
leafContent =
  between (char '\"') (char '\"') (
    many $ charOrEscape "\"" "\""
    )

charOrEscape            :: String -> String -> Parser Char
charOrEscape []     den = noneOf den
charOrEscape (e:es) den = (char '\\' >> char e) <|> charOrEscape es den

node :: Parser FileTree
node =
  do spaces
     string "node"
     spaces
     n <- name
     spaces
     char '='
     spaces
     c <- nodeContent
     spaces
     return $ Node n c

nodeContent :: Parser [FileTree]
nodeContent =
  between (char '[') (char ']') (
    many fileTree
    )

name ::  Parser String
name =
  between (char '\'') (char '\'') (
    many $ noneOf "\'"
    )

escapedQuote :: Parser String
escapedQuote = string "\\\""
