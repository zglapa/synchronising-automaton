import Test.HUnit
import System.Exit
import UtilTest

main :: IO ()
main = do
    counts <- runTestTT $ TestList [testPrintStringAsAList, testPrintStringAsAListEmpty, 
                                    testQuicksort, testUniqueSorted]
    if errors counts > 0 || failures counts > 0
        then exitFailure
        else exitSuccess