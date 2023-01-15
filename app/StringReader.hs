module StringReader (
    splitByCommas,
    splitBySpaces,
    stringToState,
    readStates,
    readAlphabet,
    readTransition,
    readStartState,
    readEndStates
) where

import DFA

-- Split string by spaces
splitBySpaces :: String -> [String]
splitBySpaces [] = []
splitBySpaces str = (takeWhile (/= ' ') str) : splitBySpaces (dropWhile (== ' ') (dropWhile (/= ' ') str))

-- Split string by commas
splitByCommas :: String -> [String]
splitByCommas [] = []
splitByCommas str = (takeWhile (/= ',') str) : splitByCommas (dropWhile (== ',') (dropWhile (/= ',') str))

-- Convert string to state type
stringToState :: String -> State Int
stringToState str = State (read str :: Int)

-- Read list of states from string
readStates :: String -> [State Int]
readStates str = map stringToState (splitBySpaces str)

-- Read alphabet from string
readAlphabet :: String -> [Char]
readAlphabet str = map (\x -> head x) (splitBySpaces str)

-- Read transition from string
readTransition :: String -> [(State Int, Char, State Int)]
readTransition str = map (\[x, y, z] -> (stringToState x, head y, stringToState z)) [(splitBySpaces str)]

-- Read start state from string
readStartState :: String -> State Int
readStartState str = stringToState str

-- Read end states from string
readEndStates :: String -> [State Int]
readEndStates str = readStates str
