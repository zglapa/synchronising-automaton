import Test.HUnit
import System.Exit
import QueueTest
import DFATest

main :: IO ()
main = do
    counts <- runTestTT $ TestList [testEnqueue, testEnqueueList, 
                                    testDequeue, testDequeueEmpty, 
                                    testDequeueL1Empty, testExtractValue,
                                    testStateShow, testDFAShow]
    if errors counts > 0 || failures counts > 0
        then exitFailure
        else exitSuccess