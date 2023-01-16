module Algorithms.SynchronisingWord (
    findShortestSynchronisingWord,
    breadthFirstSearch,
    getAllNeighbours,
    getAllUnvisitedNeighbours,
    Queue(..),
) where

import DataStructures.DFA
import DataStructures.Queue

getAllNeighbours :: Eq a => DFA [a] -> State [a] -> [(Char, State [a])]
getAllNeighbours dfa state = [(symbol, toState) | (fromState, symbol, toState) <- transitions dfa, fromState == state]

getAllUnvisitedNeighbours :: Eq a => DFA [a] -> [State [a]] -> State [a] -> [(Char, State [a])]
getAllUnvisitedNeighbours dfa visited state = 
    [neighbour | neighbour <- getAllNeighbours dfa state, not (elem (snd neighbour) visited)]

breadthFirstSearch :: DFA [Int] -> Queue (String, State [Int]) -> [State [Int]] -> Maybe String
breadthFirstSearch dfa queue visited = case dequeue queue of
    Nothing -> Nothing
    Just (front_el, queue) -> if elem front_state (endStates dfa) 
                            then Just (reverse front_word) 
                            else breadthFirstSearch dfa newQueue newVisited
        where
            front_state = snd front_el
            front_word = fst front_el
            neighbours = getAllUnvisitedNeighbours dfa visited front_state
            queue_new_elements = map (\(a,state) -> (a : front_word, state)) neighbours
            newQueue = enqueueList queue_new_elements queue
            newVisited = visited ++ map snd queue_new_elements

findShortestSynchronisingWord :: DFA [Int] -> String
findShortestSynchronisingWord dfa = case breadthFirstSearch dfa (Queue [("", startState dfa)] []) [startState dfa] of
    Nothing -> "Automaton cannot be synchronised."
    Just word -> word