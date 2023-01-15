module Main where

import Printer
import FileReader
import System.Environment
import System.IO

main :: IO ()
main = do
    (fileName:_) <- getArgs
    file <- openFile fileName ReadMode
    dfa <- readDFAFromFile file
    printDFA dfa
    hClose file
