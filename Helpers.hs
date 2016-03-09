module Helpers
( readGravityMazeFile
, printMaze
, findPlayerIndex
, clockwiseRotation
, counterClockwiseRotation
, oneHundredEightyRotation
, valueAtIndex
) where

import Prelude
import Data.Char
import Data.List

readGravityMazeFile :: String -> IO ([[Char]],[[Char]])
readGravityMazeFile = readIO

printMaze :: [[Char]] -> IO ()
printMaze [] = do
	       print ""
printMaze (ro:ros) = do
	  	     print ro
		     printMaze ros


findPlayerIndex :: Eq a => a -> [a] -> [Int]
findPlayerIndex el list = findHelper el list 0

findHelper :: Eq a => a -> [a] -> Int -> [Int]
findHelper _ [] _ = []
findHelper el (he:ta) ind
	   | el == he	= ind:(findHelper el ta (ind+1))
	   | otherwise	= findHelper el ta (ind+1)


clockwiseRotation :: [[Char]] -> [[Char]]
clockwiseRotation maze =  (transpose . reverse) maze

counterClockwiseRotation :: [[Char]] -> [[Char]]
counterClockwiseRotation maze = (reverse . transpose) maze

oneHundredEightyRotation :: [[Char]] -> [[Char]]
oneHundredEightyRotation maze = clockwiseRotation(clockwiseRotation(maze))


-- retruns the value at a given index position
valueAtIndex :: Int -> [Char] -> Char
valueAtIndex index maze = (!!) maze index
