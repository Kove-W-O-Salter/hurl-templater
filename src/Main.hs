module Main where

import System.IO.Hurl
import System.Directory
import System.Environment

--
-- Check wether the user passed an action in and, if so, 
-- passing the renaming arguments to the action.
--
main :: IO ()
main =
  do as <- getArgs
     case as of
       []     -> putStrLn "error: no arguments."
       (x:xs) ->
         case lookup x actionTable of
           Nothing -> putStrLn "error: unknown action."
           Just  f -> f xs

--
-- The action lookup table.
--
actionTable :: [(String, ([String] -> IO ()))]
actionTable = [
  ("new", new)
  ]

--
-- Create a new directory with the structure of a specified template.
--
new       :: [String] -> IO ()
new [x,y] = do t <- readTemplate x; createDirectory y; runHurl y t
new _     = putStrLn "error: new: insufficient arguments."

--
-- Read the contents of a template.
--
readTemplate   :: String -> IO String
readTemplate t =
  do tp <- templatePath t
     readFile tp

--
-- Build the full path of a template.
--
templatePath   :: String -> IO FilePath
templatePath t =
  do td <- templateDir
     return (td ++ "/" ++ (templateName t))

--
-- Attach the file extension to the templates name.
--
templateName   :: String -> FilePath
templateName t = t ++ ".hurl"

--
-- The directory where templates are stored.
--
templateDir :: IO FilePath
templateDir =
  do h <- getHomeDirectory
     return (h ++ "/.hurl")
