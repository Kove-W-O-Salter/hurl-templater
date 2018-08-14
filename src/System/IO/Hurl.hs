
module System.IO.Hurl (runHurl) where

import System.IO.Hurl.Data
import System.IO.Hurl.Parser

runHurl             :: FilePath -> String -> IO ()
runHurl root source =
  case parse hurl "Hurl" source of
    Left  err -> print err
    Right fts -> runFileTrees root fts
