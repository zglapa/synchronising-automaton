module Main where

import IO.Printer
import IO.FileReader
import System.Environment
import System.IO
import DataStructures.DFA
import Algorithms.PowerConstruction
import Algorithms.SynchronisingWord

main :: IO ()
main = do
    (fileName:_) <- getArgs
    file <- openFile fileName ReadMode
    dfa <- readDFAFromFile file
    putStrLn (findShortestSynchronisingWord (powerDFA dfa))
    hClose file
