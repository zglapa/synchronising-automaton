module QueueTest(
    testEnqueue,
    testEnqueueList,
    testDequeue,
    testDequeueEmpty,
    testDequeueL1Empty,
    testExtractValue
) where

import Test.HUnit
import DataStructures.Queue

testEnqueue = TestCase $ assertEqual "enqueue" (Queue [] [1,2,3]) (enqueue 1 (enqueue 2 (enqueue 3 (Queue [] []))))

testEnqueueList = TestCase $ assertEqual "enqueueList" (Queue [] [3,2,1]) (enqueueList [1,2,3] (Queue [] []))

testDequeue = TestCase $ assertEqual "dequeue" (Just (1, Queue [2,3] [])) (dequeue (Queue [1,2,3] []))

testDequeueEmpty = TestCase $ assertEqual "dequeueEmpty" (Nothing :: Maybe (Int, Queue Int)) (dequeue (Queue [] []))

testDequeueL1Empty = TestCase $ assertEqual "dequeueL1Empty" (Just (3, Queue [2,1] [])) ( dequeue (Queue [] [1,2,3]))

testExtractValue = TestCase $ assertEqual "extractValue" (1, Queue [2,3] [4,5]) (extractValue (dequeue (Queue [1,2,3] [4,5])))
