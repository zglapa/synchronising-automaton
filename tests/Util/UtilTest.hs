module UtilTest(
    testPrintStringAsAList,
    testPrintStringAsAListEmpty,
    testQuicksort,
    testUniqueSorted
) where

import Test.HUnit
import Util.Util

testPrintStringAsAList = TestCase $ assertEqual "printStringAsAList" "[a, b, c]" (printStringAsAList "abc")
testPrintStringAsAListEmpty = TestCase $ assertEqual "printStringAsAListEmpty" "[]" (printStringAsAList "")

testQuicksort = TestCase $ assertEqual "quicksort" [1, 2, 3, 4, 5] (quicksort [5, 4, 3, 2, 1])

testUniqueSorted = TestCase $ assertEqual "uniqueSorted" [1, 2, 3, 4, 5] (uniqueSorted [1, 1, 2, 2, 3, 3, 4, 4, 5, 5])