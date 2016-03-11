import Prelude
import System.Environment ( getArgs )
import Data.List
import Helpers

-- The main method that will be used for testing / command line access
main = do
     args <- getArgs
     filename <- readFile (head args)
     (maze,moves) <- readGravityMazeFile filename
     print "Result"
     printMaze (onePlayerManyRotations maze moves)

-- YOUR CODE SHOULD COME AFTER THIS POINT

--TODO once a player hits the goal, game is over


onePlayerManyRotations :: [[Char]] -> [[Char]] -> [[Char]]
onePlayerManyRotations maze [] = maze
onePlayerManyRotations maze (he:ta)
  | he == "c"   = onePlayerManyRotations (makeMove c) ta
  | he == "cc"  = onePlayerManyRotations (makeMove cc) ta
  | he == "180" = onePlayerManyRotations (makeMove oneEighty) ta
  | otherwise   = error "bad move"
  where
    c         = clockwiseRotation (maze)
    cc        = counterClockwiseRotation (maze)
    oneEighty = oneHundredEightyRotation (maze)
