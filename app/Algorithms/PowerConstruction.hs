module Algorithms.PowerConstruction (
  powerDFA
) where

import DataStructures.DFA
import Util.Util

-- Unveil inner state type
unveilStates :: [State a] -> [a]
unveilStates states = [name state | state <- states]

-- Create power set
powerSet :: [a] -> [[a]]
powerSet [] = [[]]
powerSet (x:xs) = powerSet xs ++ [x:ys | ys <- powerSet xs]

-- Create power set of states
powerSetOfStates :: (Eq a) => [State a] -> [State [a]]
powerSetOfStates states = [State state | state <- filter (/= []) (powerSet (unveilStates states))]

-- Create transition for power state and symbol
transitionForPowerState :: (Ord a, Eq a) => State [a] -> [(State a, Char, State a)] -> Char -> (State [a], Char, State [a])
transitionForPowerState powerState transitions symbol = (powerState, symbol, State ( uniqueSorted (quicksort [name toState | (fromState, symbol', toState) <- transitions, 
                                    elem (name fromState) (name powerState), symbol' == symbol])))

-- Create power set of transitions
powerSetOfTransitions :: (Ord a, Eq a) => [State [a]] -> [(State a, Char, State a)] -> [Char] -> [(State [a], Char, State [a])]
powerSetOfTransitions powerStates transitions alphabet = [transitionForPowerState powerState transitions symbol | powerState <- powerStates, symbol <- alphabet]

-- Create power DFA with power start state and singleton end states
powerDFA :: (Ord a, Eq a) => DFA a -> DFA [a]
powerDFA dfa = DFA {
    states = powerSetOfStates (states dfa),
    alphabet = alphabet dfa,
    transitions = powerSetOfTransitions (powerSetOfStates (states dfa)) (transitions dfa) (alphabet dfa),
    startState = State (unveilStates (states dfa)),
    endStates = [State [name state] | state <- states dfa]
}
