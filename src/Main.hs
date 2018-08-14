module Main where

import System.IO.Hurl
import System.Directory
import System.Environment

main :: IO ()
main =
  do as <- getArgs
     case as of
       []     -> putStrLn "error: no arguments."
       (x:xs) ->
         case lookup x actionTable of
           Nothing -> putStrLn "error: unknown action."
           Just  f -> f xs

actionTable :: [(String, ([String] -> IO ()))]
actionTable = [
  ("new", new)
  ]

new       :: [String] -> IO ()
new [x,y] = do t <- readTemplate x; createDirectory y; runHurl y t
new _     = putStrLn "error: new: insufficient arguments."

readTemplate   :: String -> IO String
readTemplate t =
  do tp <- templatePath t
     readFile tp

templatePath   :: String -> IO FilePath
templatePath t =
  do td <- templateDir
     return (td ++ "/" ++ (templateName t))

templateName   :: String -> FilePath
templateName t = t ++ ".hurl"

templateDir :: IO FilePath
templateDir =
  do h <- getHomeDirectory
     return (h ++ "/.hurl")
