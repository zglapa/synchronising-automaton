module IO.FileReader (
    readDFAFromFile
) where

import System.IO
import System.Environment
import DataStructures.DFA
import IO.StringReader

-- Read comment and ignore it
readComment :: Handle -> IO ()
readComment file = do
    line <- hGetLine file
    return ()

-- Read list of states from file
readStatesFromFile :: Handle -> IO [State Int]
readStatesFromFile file = do
    line <- hGetLine file
    return (readStates line)

-- Read alphabet from file
readAlphabetFromFile :: Handle -> IO [Char]
readAlphabetFromFile file = do
    line <- hGetLine file
    return (readAlphabet line)

-- Check if line is comment
isComment :: String -> Bool
isComment [] = False
isComment str = take 2 str == "--"

-- Read transitions from file
readTransitionsFromFile :: Handle -> IO ([(State Int, Char, State Int)])
readTransitionsFromFile file = do
    line <- hGetLine file
    if isComment line
        then return []
        else do
            rest <- readTransitionsFromFile file
            return (readTransition line ++ rest)

-- Read start state from file
readStartStateFromFile :: Handle -> IO (State Int)
readStartStateFromFile file = do
    line <- hGetLine file
    return (readStartState line)

-- Read end states from file
readEndStatesFromFile :: Handle -> IO [State Int]
readEndStatesFromFile file = do
    line <- hGetLine file
    return (readEndStates line)

-- Read DFA from file
readDFAFromFile :: Handle -> IO (DFA Int)
readDFAFromFile file = do
    readComment file
    states <- readStatesFromFile file
    alphabet <- readAlphabetFromFile file
    readComment file
    transitions <- readTransitionsFromFile file
    startState <- readStartStateFromFile file
    endStates <- readEndStatesFromFile file
    return (DFA {states = states, alphabet = alphabet, transitions = transitions, 
                    startState = startState, endStates = endStates})
