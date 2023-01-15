module Util(
  printStringAsAList,
) where

printStringAsAList :: String -> String 
printStringAsAList [] = "[]"
printStringAsAList (x:xs) = "[" ++ (foldl (\a b -> a ++ ", " ++ [b]) [x] xs) ++ "]"
