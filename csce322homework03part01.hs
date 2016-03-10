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
  | move == "c"   = recombine cols (flatten c)
  | move == "cc"  = cc
  | move == "180" = makeMove oneEighty
  | otherwise     = error "bad move"
  where
    c         = clockwiseRotation (maze)
    cc        = counterClockwiseRotation (maze)
    oneEighty = oneHundredEightyRotation (maze)
    cols      = length (head maze)




--take the rotated maze, rotate cc
--flatten maze
-- TODO get the player array going for multiple players
-- move player
-- recombine maze
-- rotate maze c
--
makeMove :: [[Char]] -> [[Char]]
makeMove maze = clockwiseRotation (recombine cols (moveAllPlayers playerOrd ccFlatten))
  where
    cc        = counterClockwiseRotation (maze)
    ccFlatten = flatten (cc)
    cols      = length (head cc)
    playerOrd =  getPlayersOrd [] ccFlatten


recombine :: Int -> [Char] -> [[Char]]
recombine _ [] = []
recombine cut maze
  | cut > 0 = (take cut maze) : (recombine cut (drop cut maze))
  | otherwise = []


-- take a 2d char list and flatten it to a 1d list
flatten :: [[Char]] -> [Char]
flatten maze =  concat(maze)

-- checks if position + 1 is a movable position for a player
isMovable :: Int -> [Char] -> Bool
isMovable pos maze
  | valueAtIndex (pos + 1) maze == '-' = True
  | valueAtIndex (pos + 1) maze == 'g' = True
  | otherwise = False

--TODO make a moveAllPlayers
-- takes a flattened array
-- will use movePlayer, but will take a [char], return [char]
moveAllPlayers :: [Char] -> [Char] -> [Char]
moveAllPlayers [] maze         = maze
moveAllPlayers (he:ta) maze   = moveAllPlayers ta (movePlayer he maze)



--move player forward
-- TODO account for stopping at g
-- returns a maze of the moved player
movePlayer :: Char -> [Char] -> [Char]
movePlayer _ [] = []
movePlayer player (he:ta)
  | he == player && movable  = '-' : movePlayer player ( player : tail ta )
  | otherwise                = he  : movePlayer player ta
  where
    movable = isMovable 0 (he:ta)

-- returns a list of players, lowest player is first
getPlayersOrd :: [Char] -> [Char] -> [Char]
getPlayersOrd arr [] = arr
getPlayersOrd arr (he:ta)
  | he == '1' =  getPlayersOrd ('1' :  arr) ta
  | he == '2' =  getPlayersOrd ('2' :  arr) ta
  | he == '3' =  getPlayersOrd ('3' :  arr) ta
  | he == '4' =  getPlayersOrd ('4' :  arr) ta
  | otherwise =  getPlayersOrd  arr ta
