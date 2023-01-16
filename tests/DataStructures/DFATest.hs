module DFATest(
    testStateShow,
    testDFAShow
) where

import Test.HUnit
import DataStructures.DFA

testStateShow = TestCase $ assertEqual "StateShow" "{1}" (show (DataStructures.DFA.State 1))

testDFAShow = TestCase $ assertEqual "dfaShow" 
    "States: [{1},{2}]\nAlphabet: [a, b]\nTransitions: [({1},'a',{2}),({1},'b',{1}),({2},'a',{2}),({2},'b',{1})]\nStart state: {1}\nEnd states: [{2}]" 
    (show (DFA [DataStructures.DFA.State 1, DataStructures.DFA.State 2] 
                ['a', 'b'] 
                [   ((DataStructures.DFA.State 1), 'a', (DataStructures.DFA.State 2)), 
                    ((DataStructures.DFA.State 1), 'b', (DataStructures.DFA.State 1)), 
                    ((DataStructures.DFA.State 2), 'a', (DataStructures.DFA.State 2)), 
                    ((DataStructures.DFA.State 2), 'b', (DataStructures.DFA.State 1))] 
                (DataStructures.DFA.State 1) 
                [DataStructures.DFA.State 2]))