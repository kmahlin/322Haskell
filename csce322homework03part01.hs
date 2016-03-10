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
  | move == "c"   = clockwiseRotation (maze)
  | move == "cc"  = counterClockwiseRotation (maze)
  | move == "180" = oneHundredEightyRotation (maze)
  | otherwise     = ["wrong"]



-- move player
movePlayer :: Char -> [Char] -> [Char]
movePlayer player maze
  |  playerMovable = maze -- -- swap move player
  | otherwise = ['n','o'] -- todo change this, atm just for debugging
  where
    playerMovable = isMovable position maze
    position      = (head (findPlayerIndex player maze))


-- I want to say, if dash, move, if x stop
-- you would give it a player position, and as if the next space is open
isMovable :: Int -> [Char] -> Bool
isMovable pos maze
  | valueAtIndex (pos + 1) maze == '-' = True
  | valueAtIndex (pos + 1) maze == 'g' = True
  | otherwise = False


--just moves player 1 atm
move :: Char -> [Char] -> [Char]
move _ [] = []
move player (he:ta)
  | he == player && movable  = '-' : move player ( player : tail ta )
  | otherwise                = he : move player ta
  where
    movable = isMovable 0 (he:ta)

-- Get all players
getPlayers :: [Char] -> [Char] -> [Char]
getPlayers arr [] = arr
getPlayers arr (he:ta)
  | he == '1' =  getPlayers ('1' :  arr) ta
  | he == '2' =  getPlayers ('2' :  arr) ta
  | he == '3' =  getPlayers ('3' :  arr) ta
  | he == '4' =  getPlayers ('4' :  arr) ta
  | otherwise =  getPlayers  arr ta

swap :: Int -> Int -> [Int] -> [Int]
swap _ _ [] = []
swap n m (x:xs)
  | n == x = m : (swap n m xs)
  | m == x = n : (swap n m xs)
  | otherwise = x : (swap n m xs)
