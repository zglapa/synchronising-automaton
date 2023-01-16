module PowerConstructionTest(
    unveilStatesTest,
    powerSetTest,
    powerSetOfStatesTest,
    transitionForPowerStateTest,
    powerSetOfTransitionsTest,
    powerDFATest
) 
where

import Test.HUnit
import DataStructures.DFA as DS
import Algorithms.PowerConstruction
import Util.Util



unveilStatesTest = TestCase $ assertEqual "unveilStates" 
    [1, 2, 3] 
    (unveilStates [DS.State  1, DS.State  2, DS.State  3])

powerSetTest = TestCase $ assertEqual "powerSet" 
    (quicksort [[], [1], [2], [3], [1,2], [1,3], [2,3], [1,2,3]]) 
    (quicksort (powerSet [1, 2, 3]))

powerSetOfStatesTest = TestCase $ assertEqual "powerSetOfStates" 
    (quicksort [DS.State  [1], DS.State  [2], DS.State  [3], 
                DS.State  [1,2], DS.State  [1,3], DS.State  [2,3], 
                DS.State  [1,2,3]]) 
    (quicksort (powerSetOfStates [DS.State  1, DS.State  2, DS.State  3]))

transitionForPowerStateTest = TestCase $ assertEqual "transitionForPowerState" 
    ((DS.State  [1,2]), 'a', (DS.State  [2,3]))
    (transitionForPowerState 
        (DS.State   [1,2]) 
        [   (DS.State  1, 'a', DS.State  2), 
            (DS.State  2, 'b', DS.State  1), 
            (DS.State  2, 'a', DS.State  3), 
            (DS.State  3, 'a', DS.State  4)] 
        'a' )

powerSetOfTransitionsTest = TestCase $ assertEqual "powerSetOfTransitions" 
    (quicksort [    (DS.State [1], 'a', DS.State [2]), (DS.State [1], 'b', DS.State [1]), 
                    (DS.State [2], 'a', DS.State [1]), (DS.State [2], 'b', DS.State [1]),
                    (DS.State [1,2], 'a', DS.State [1,2]), (DS.State [1,2], 'b', DS.State [1])])
    (quicksort (powerSetOfTransitions 
        [DS.State [1], DS.State [2], DS.State [1,2]]
        [   (DS.State 1, 'a', DS.State 2), (DS.State 1, 'b', DS.State 1), 
            (DS.State 2, 'a', DS.State 1), (DS.State 2, 'b', DS.State 1)]
        ['a', 'b']))

powerDFATest = TestCase $ assertEqual "powerDFATest" 
    (DFA 
        [DS.State [2], DS.State [1], DS.State [1,2]] 
        ['a', 'b'] 
        [   (DS.State [2], 'a', DS.State [1]), (DS.State [2], 'b', DS.State [1]), 
            (DS.State [1], 'a', DS.State [2]), (DS.State [1], 'b', DS.State [1]),
            (DS.State [1,2], 'a', DS.State [1,2]), (DS.State [1,2], 'b', DS.State [1])]
        (DS.State [1,2]) 
        [DS.State [1], DS.State [2]])
    (powerDFA 
        (DFA 
            [DS.State 1, DS.State 2] 
            ['a', 'b'] 
            [   (DS.State 1, 'a', DS.State 2), (DS.State 1, 'b', DS.State 1), 
                (DS.State 2, 'a', DS.State 1), (DS.State 2, 'b', DS.State 1)]
            (DS.State 1) 
            [DS.State 1]))