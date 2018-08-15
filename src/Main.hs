module Main where

import Data.Maybe
import System.IO.Hurl
import System.Process
import System.FilePath
import System.Directory
import System.Environment

--
-- Check wether the user passed an action in and, if so,
-- passing the renaming arguments to the action.
--
main :: IO ()
main =
  do createTemplateDir
     as <- getArgs
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
  ("new",    new),
  ("create", create)
  ]

--
-- Create a new directory with the structure of a specified template.
--
new       :: [String] -> IO ()
new [x,y] = createDirectory y >> readTemplate x >>= runHurl y
new _     = putStrLn "error: new: insufficient arguments."


--
-- Create a new template.
--
create :: [String] -> IO ()
create [x] =
  do e <- getEnv' "EDITOR"
     if not (null e) then
       do t <- templatePath x
          callCommand (e ++ " " ++ t)
     else
       putStrLn "error: create: $EDITOR is empty."

create _   = putStrLn "error: create: insufficient arguments."

--
-- If var is in the environment return it's value, otherwise return std.
--
getEnv'     :: String -> IO String
getEnv' var =
  do val <- lookupEnv var
     return $ fromMaybe [] val

--
-- Read the contents of a template.
--
readTemplate   :: String -> IO String
readTemplate t =
  do tp <- templatePath t
     te <- doesFileExist tp
     if te then
      readFile tp
     else
      do putStrLn "error: readTemplate: template does not exist."
         return []

--
-- Build the full path of a template.
--
templatePath   :: String -> IO FilePath
templatePath t =
  do td <- templateDir
     return $ joinPath [td, templateName t]

--
-- Attach the file extension to the templates name.
--
templateName :: String -> FilePath
templateName = (<.> "hurl")


--
-- Create the template directory if it does not already exist.
--
createTemplateDir :: IO ()
createTemplateDir =
  do td <- templateDir
     createDirectoryIfMissing False td

--
-- The directory where templates are stored.
--
templateDir :: IO FilePath
templateDir =
  do h <- getHomeDirectory
     return (joinPath [h, ".hurl"])
