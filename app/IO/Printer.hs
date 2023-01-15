module IO.Printer (
    printDFA
) where

import DataStructures.DFA

-- Print a DFA to the console
printDFA :: (Eq a, Show a) => DFA a -> IO ()
printDFA dfa = do
    print dfa