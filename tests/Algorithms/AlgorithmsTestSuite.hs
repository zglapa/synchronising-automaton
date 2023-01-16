import Test.HUnit
import System.Exit
import PowerConstructionTest
import SynchronisingWordTest

main :: IO ()
main = do
    counts <- runTestTT $ TestList [ 
        unveilStatesTest, powerSetTest, powerSetOfStatesTest, 
        transitionForPowerStateTest, powerSetOfTransitionsTest,
        powerDFATest, getAllNeighboursTest, getAllUnvisitedNeighboursTest,
        getAllUnvisitedNeighboursAllVisitedTest,
        breadthFirstSearchTest,
        breadthFirstSearchTestNonSynchronisable,
        findShortestSynchronisingWordTest,
        findShortestSynchronisingWordTestNonSynchronisable
        ]
    if errors counts > 0 || failures counts > 0
        then exitFailure
        else exitSuccess