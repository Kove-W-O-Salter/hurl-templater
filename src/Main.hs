module Main where

import System.IO.Hurl
import System.Directory
import System.Environment

templateDir :: IO FilePath
templateDir =
  do h <- getHomeDirectory
     return (h ++ "/.hurl")

templateName   :: String -> FilePath
templateName t = t ++ ".hurl"

templatePath   :: String -> IO FilePath
templatePath t =
  do td <- templateDir
     return (td ++ "/" ++ (templateName t))

readTemplate   :: String -> IO String
readTemplate t =
  do tp <- templatePath t
     readFile tp

new       :: [String] -> IO ()
new [x,y] = readTemplate x >>= runHurl y
new _     = putStrLn "error: new: insufficient arguments."

actionTable :: [(String, ([String] -> IO ()))]
actionTable = [
  ("new", new)
  ]

main :: IO ()
main =
  do as <- getArgs
     case as of
       []     -> putStrLn "error: no arguments."
       (x:xs) ->
         case lookup x actionTable of
           Nothing -> putStrLn "error: unknown action."
           Just  f -> f xs
