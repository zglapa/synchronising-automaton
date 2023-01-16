import Test.HUnit
import System.Exit
import StringReaderTest

main :: IO ()
main = do
    counts <- runTestTT $ TestList [testSplitBySpaces, testSplitBySpacesEmpty, 
                                    testSplitBySpacesOnlySpaces, testSplitByCommas,
                                    testSplitByCommasEmpty, testSplitByCommasOnlyCommas,
                                    testStringToState, testReadStates, testReadStatesEmpty,
                                    testReadAlphabet, testReadAlphabetEmpty, testReadTransition,
                                    testReadTransitionEmpty, testReadStartState, testReadEndStates]

    if errors counts > 0 || failures counts > 0
        then exitFailure
        else exitSuccess