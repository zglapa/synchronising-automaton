module Main where

import DFA
import ExampleAutomata
import Printer

main :: IO ()
main = printDFA dfa_even_a
