module Util.Util(
  printStringAsAList,
  quicksort,
  uniqueSorted
) where

printStringAsAList :: String -> String 
printStringAsAList [] = "[]"
printStringAsAList (x:xs) = "[" ++ (foldl (\a b -> a ++ ", " ++ [b]) [x] xs) ++ "]"

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort [a | a <- xs, a <= x] ++ [x] ++ quicksort [a | a <- xs, a > x]

uniqueSorted :: (Eq a, Ord a) => [a] -> [a]
uniqueSorted [] = []
uniqueSorted [x] = [x]
uniqueSorted (x:y:xs) = if x == y then uniqueSorted (y:xs) else x : uniqueSorted (y:xs)
