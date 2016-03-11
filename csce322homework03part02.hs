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
onePlayerManyRotations maze moves = makeAllRotation maze moves



-- maybe make a MakeAllRotation function
makeAllRotation :: [[Char]] -> [[Char]] -> [[Char]]
-- take maze moves goalbool -> return maze
makeAllRotation maze []  = maze
makeAllRotation maze (he:ta)
  | he == "c"    = makeAllRotation (makeMove c) ta
  | he == "cc"   = makeAllRotation (makeMove cc) ta
  | he == "180"  = makeAllRotation (makeMove oneEighty) ta
  | otherwise    = error "bad move"
  where
    c         = clockwiseRotation (maze)
    cc        = counterClockwiseRotation (maze)
    oneEighty = oneHundredEightyRotation (maze)
