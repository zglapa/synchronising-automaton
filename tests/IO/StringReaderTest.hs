module StringReaderTest(
    testSplitBySpaces,
    testSplitBySpacesEmpty,
    testSplitBySpacesOnlySpaces,
    testSplitByCommas,
    testSplitByCommasEmpty,
    testSplitByCommasOnlyCommas,
    testStringToState,
    testReadStates,
    testReadStatesEmpty,
    testReadAlphabet,
    testReadAlphabetEmpty,
    testReadTransition,
    testReadTransitionEmpty,
    testReadStartState,
    testReadEndStates,
) where

import Test.HUnit
import IO.StringReader
import DataStructures.DFA

testSplitBySpaces = TestCase $ assertEqual "splitBySpaces" ["a", "b", "c"] (splitBySpaces "a b c")
testSplitBySpacesEmpty = TestCase $ assertEqual "splitBySpacesEmpty" [] (splitBySpaces "")
testSplitBySpacesOnlySpaces = TestCase $ assertEqual "splitBySpacesOnlySpaces" [] (splitBySpaces "   ")

testSplitByCommas = TestCase $ assertEqual "splitByCommas" ["a", "b", "c"] (splitByCommas "a,b,c")
testSplitByCommasEmpty = TestCase $ assertEqual "splitByCommasEmpty" [] (splitByCommas "")
testSplitByCommasOnlyCommas = TestCase $ assertEqual "splitByCommasOnlyCommas" [] (splitByCommas ",,,")

testStringToState = TestCase $ assertEqual "stringToState" (DataStructures.DFA.State 1) (stringToState "1")

testReadStates = TestCase $ assertEqual "readStates" [DataStructures.DFA.State 1, DataStructures.DFA.State 2] (readStates "1 2")
testReadStatesEmpty = TestCase $ assertEqual "readStatesEmpty" [] (readStates "")

testReadAlphabet = TestCase $ assertEqual "readAlphabet" ['a', 'b'] (readAlphabet "a b")
testReadAlphabetEmpty = TestCase $ assertEqual "readAlphabetEmpty" [] (readAlphabet "")

testReadTransition = TestCase $ assertEqual "readTransition" [((DataStructures.DFA.State 1), 'a', (DataStructures.DFA.State 2))] (readTransition "1 a 2")
testReadTransitionEmpty = TestCase $ assertEqual "readTransitionEmpty" [] (readTransition "")

testReadStartState = TestCase $ assertEqual "readStartState" (DataStructures.DFA.State 1) (readStartState "1")

testReadEndStates = TestCase $ assertEqual "readEndStates" [DataStructures.DFA.State 1, DataStructures.DFA.State 2] (readEndStates "1 2")