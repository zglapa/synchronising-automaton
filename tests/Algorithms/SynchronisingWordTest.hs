module SynchronisingWordTest(
    getAllNeighboursTest,
    getAllUnvisitedNeighboursTest,
    getAllUnvisitedNeighboursAllVisitedTest,
    breadthFirstSearchTest,
    breadthFirstSearchTestNonSynchronisable,
    findShortestSynchronisingWordTest,
    findShortestSynchronisingWordTestNonSynchronisable
) where

import Test.HUnit
import DataStructures.DFA as DS
import Algorithms.SynchronisingWord
import Util.Util
import Algorithms.PowerConstruction

exampleDFA = (DFA 
        [DS.State [2], DS.State [1], DS.State [1,2]] 
        ['a', 'b'] 
        [   (DS.State [2], 'a', DS.State [1]), (DS.State [2], 'b', DS.State [1]), 
            (DS.State [1], 'a', DS.State [2]), (DS.State [1], 'b', DS.State [1]),
            (DS.State [1,2], 'a', DS.State [1,2]), (DS.State [1,2], 'b', DS.State [1])]
        (DS.State [1,2]) 
        [DS.State [1], DS.State [2]])

dfa_even_a = DFA {
    states = [DS.State  0, DS.State  1],
    alphabet = ['a', 'b'],
    transitions = [
        (DS.State  0, 'a', DS.State  1),
        (DS.State  0, 'b', DS.State  0),
        (DS.State  1, 'a', DS.State  0),
        (DS.State  1, 'b', DS.State  1)
    ],
    startState = DS.State  0,
    endStates = [DS.State  0]
}


getAllNeighboursTest = TestCase $ assertEqual "getAllNeighbours" 
    (quicksort [('a', DS.State [1,2]), ('b', DS.State [1])]) 
    (quicksort (getAllNeighbours exampleDFA (DS.State [1,2])))

getAllUnvisitedNeighboursTest = TestCase $ assertEqual "getAllUnvisitedNeighbours" 
    (quicksort [('a', DS.State [1,2])]) 
    (quicksort (getAllUnvisitedNeighbours exampleDFA [DS.State [1]] (DS.State [1,2]) ))

getAllUnvisitedNeighboursAllVisitedTest = TestCase $ assertEqual "getAllUnvisitedNeighboursAllVisited" 
    [] (getAllUnvisitedNeighbours exampleDFA [DS.State [1], DS.State [2], DS.State [1,2]] (DS.State [1,2]) )

breadthFirstSearchTest = TestCase $ assertEqual "breadthFirstSearch" 
    (Just "b")
    (breadthFirstSearch exampleDFA (Queue [("", DS.State [1,2])] []) [DS.State [1,2]] )

breadthFirstSearchTestNonSynchronisable = TestCase $ assertEqual "breadthFirstSearchNonSynchronisable"
    Nothing
    (breadthFirstSearch (powerDFA dfa_even_a) (Queue [("", DS.State [0,1])] []) [DS.State [0,1]])

findShortestSynchronisingWordTest = TestCase $ assertEqual "findShortestSynchronisingWord" 
    "b"
    (findShortestSynchronisingWord exampleDFA)

findShortestSynchronisingWordTestNonSynchronisable = TestCase $ assertEqual "findShortestSynchronisingWordNonSynchronisable"
    "Automaton cannot be synchronised."
    (findShortestSynchronisingWord (powerDFA dfa_even_a))