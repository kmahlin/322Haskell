import Prelude
import System.Environment ( getArgs )
import Data.List
import Helpers
import Debug.Trace

-- The main method that will be used for testing / command line access
main = do
     args <- getArgs
     filename <- readFile (head args)
     (maze,moves) <- readGravityMazeFile filename
     print "Result"
     printMaze (onePlayerOneRotation maze (head moves))

-- YOUR CODE SHOULD COME AFTER THIS POINT
onePlayerOneRotation :: [[Char]] -> [Char] -> [[Char]]
onePlayerOneRotation maze move
  | move == "c"   = clockwiseRotation (maze)
  | move == "cc"  = counterClockwiseRotation (maze)
  | move == "180" = oneHundredEightyRotation (maze)
  | otherwise     = ["wrong"]

-- movePlayer :: [[Char]] -> [[Char]]
-- movePlayer maze


clockwiseRotation :: [[Char]] -> [[Char]]
clockwiseRotation maze =  (transpose . reverse) maze

counterClockwiseRotation :: [[Char]] -> [[Char]]
counterClockwiseRotation maze = (reverse . transpose) maze

oneHundredEightyRotation :: [[Char]] -> [[Char]]
oneHundredEightyRotation maze = clockwiseRotation(clockwiseRotation(maze))
