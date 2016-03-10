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
     printMaze (onePlayerOneRotation maze (head moves))

-- YOUR CODE SHOULD COME AFTER THIS POINT
onePlayerOneRotation :: [[Char]] -> [Char] -> [[Char]]
onePlayerOneRotation maze move
  | move == "c"   = makeMove c
  | move == "cc"  = makeMove cc
  | move == "180" = makeMove oneEighty
  | otherwise     = error "bad move"
  where
    c         = clockwiseRotation (maze)
    cc        = counterClockwiseRotation (maze)
    oneEighty = oneHundredEightyRotation (maze)
    cols      = length (head maze)


-- This method has a lot going on. What it does is :
-- takes a maze, then rotates it counterClockwiseRotation so cols are now rows
-- then flattens the maze (2d -> 1d), and moves every player in the flattened maze
-- then recombines (1d -> 2d) maze, which splits the 1d based on col value
-- then rotates the 2d maze back to orginal position
-- returns 2d maze
makeMove :: [[Char]] -> [[Char]]
makeMove maze = clockwiseRotation (recombine cols (moveAllPlayers playerOrd ccFlatten))
  where
    cc        = counterClockwiseRotation (maze)
    ccFlatten = flatten (cc)
    cols      = length (head cc)
    playerOrd =  getPlayersOrd [] ccFlatten


--recombines (1d -> 2d) maze, splits the 1d based on int value
recombine :: Int -> [Char] -> [[Char]]
recombine _ [] = []
recombine cut maze
  | cut > 0 = (take cut maze) : (recombine cut (drop cut maze))
  | otherwise = []


-- take a 2d char list and flatten it to a 1d list
flatten :: [[Char]] -> [Char]
flatten maze =  concat(maze)


-- takes a flattened array
-- will use movePlayer, but will take a [char], return [char]
-- Takes an empty list and a  flattned maze
-- retruns a list of all players on the board
moveAllPlayers :: [Char] -> [Char] -> [Char]
moveAllPlayers [] maze        = maze
moveAllPlayers (he:ta) maze   = moveAllPlayers ta (movePlayer he maze)



--move player forward
-- returns a maze of the moved player
movePlayer :: Char -> [Char] -> [Char]
movePlayer _ [] = []
movePlayer player  (he:ta)
  | he == player && val == '-'   = '-' : movePlayer player ( player : tail ta )
  | he == player && val == 'g'   = '-' : he : movePlayer player ( tail ta)
  | otherwise                    = he  : movePlayer player ta
  where
    val = valueAtIndex 1 (he:ta)

-- returns a list of players in the maze, lowest player is first
-- Number of players in the game is 1 -4 inclusive
getPlayersOrd :: [Char] -> [Char] -> [Char]
getPlayersOrd arr [] = arr
getPlayersOrd arr (he:ta)
  | he == '1' =  getPlayersOrd ('1' :  arr) ta
  | he == '2' =  getPlayersOrd ('2' :  arr) ta
  | he == '3' =  getPlayersOrd ('3' :  arr) ta
  | he == '4' =  getPlayersOrd ('4' :  arr) ta
  | otherwise =  getPlayersOrd  arr ta
