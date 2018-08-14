
module Hurl.Hurl (
  FileTree(Leaf,Node),
  runFileTrees,
  evalFileTree
  ) where

--
-- So that we can create directories.
--
import System.Directory

--
-- The file tree.
--
data FileTree = Leaf FilePath String
              | Node FilePath [FileTree]
              deriving (Show, Eq)

--
-- Evaluate a list of file trees.
--
runFileTrees      :: FilePath -> [FileTree] -> IO ()
runFileTrees root = mapM_ (evalFileTree root)

--
-- Evaluate a file tree.
--
evalFileTree                 :: FilePath -> FileTree -> IO ()
evalFileTree _    (Leaf n c) = writeFile n c
evalFileTree root (Node n c) =
  do let newRoot = root ++ "/" ++ n
     createDirectory newRoot
     runFileTrees newRoot c
