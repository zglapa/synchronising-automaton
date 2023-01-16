module DataStructures.DFA (
    State(..),
    DFA(..)
) where

import Util.Util
    
-- DFA state type
data State a = State { name :: a} deriving (Eq) 
instance Show a => Show (State a) where
    show (State name) = "{" ++ show name ++ "}"
instance Ord a => Ord (State a) where
    compare (State a) (State b) = compare a b

-- DFA implementation
data DFA a = DFA { 
    states :: [State a], 
    alphabet :: [Char], 
    transitions :: [(State a, Char, State a)], 
    startState :: State a, 
    endStates :: [State a] } 
    deriving (Eq)

instance Show a => Show (DFA a) where
    show dfa = "States: " ++ show (states dfa) ++ "\n"
            ++ "Alphabet: " ++ printStringAsAList (alphabet dfa) ++ "\n"
            ++ "Transitions: " ++ show (transitions dfa) ++ "\n"
            ++ "Start state: " ++ show (startState dfa) ++ "\n"
            ++ "End states: " ++ show (endStates dfa)
