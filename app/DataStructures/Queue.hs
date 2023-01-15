module DataStructures.Queue (
    Queue(..),
    enqueue,
    dequeue,
    extractValue,
    enqueueList
) where

data Queue a = Queue [a] [a]

enqueue :: a -> Queue a -> Queue a
enqueue x (Queue l1 l2) = Queue l1 (x:l2)

dequeue :: Queue a -> Maybe (a, Queue a)
dequeue (Queue [] []) = Nothing
dequeue (Queue [] l2) = dequeue (Queue (reverse l2) [])
dequeue (Queue l1 l2) = Just (head l1, Queue (tail l1) l2)

extractValue :: Maybe (a, Queue a) -> (a, Queue a)
extractValue Nothing = error "Queue is empty"
extractValue (Just (x, queue)) = (x, queue)

enqueueList :: [a] -> Queue a -> Queue a
enqueueList [] queue = queue
enqueueList (x:xs) queue = enqueueList xs (enqueue x queue)