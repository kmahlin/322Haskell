import Prelude
import Data.Char
import Data.List

-- All added helper methods are below this point

clockwiseRotation :: [[Char]] -> [[Char]]
clockwiseRotation maze =  (transpose . reverse) maze

counterClockwiseRotation :: [[Char]] -> [[Char]]
counterClockwiseRotation maze = (reverse . transpose) maze

-- take a 2d char list and flatten it to a 1d list
flatten :: [[Char]] -> [Char]
flatten maze =  concat(maze)

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



-- This method has a lot going on. What it does is :
-- takes a maze, then rotates it counterClockwiseRotation so cols are now rows
-- then flattens the maze (2d -> 1d), and moves every player in the flattened maze
-- then recombines (1d -> 2d) maze, which splits the 1d based on col value
-- then rotates the 2d maze back to orginal position
-- returns 2d maze
-- makeMove :: [[Char]] -> [Char] -> ([[Char]] , [Char])
-- makeMove maze tfList = (clockwiseRotation (recombine cols (moveAllPlayers playerOrd ccFlatten tfList)), tfList)
--  where
--    cc        = counterClockwiseRotation (maze)
--    ccFlatten = flatten (cc)
--    cols      = length (head cc)
--    playerOrd =  getPlayersOrd [] ccFlatten

--inGoal :: [Char] -> Bool
--inGoal goalList
--	| inGoal == True = True
--	| otherwise 		 = False
--	where
--		inGoal = find' 't' goalList

-- takes a flattened array
-- will use movePlayer, but will take a [char], return [char]
-- Takes an empty list and a  flattned maze
-- retruns a list of all players on the board
-- moveAllPlayers :: [Char] -> [Char] -> [Char] -> ([Char], [Char])
-- moveAllPlayers [] maze tfList      			 = (maze, tfList)
-- moveAllPlayers (he:ta) maze tfList   = (moveAllPlayers ta (movePlayer he maze tfList), tfList)


-- move player forward
-- returns a maze of the moved player
movePlayer :: Char -> [Char] -> [Char]
movePlayer _ []  = []
movePlayer player (he:ta)
  | he == player && val == '-'   = '-' : movePlayer player ( player : tail ta )
  | he == player && val == 'g'   = '-' : he : movePlayer player ( tail ta)
  | otherwise                    = he  : movePlayer player ta
  where
    val = valueAtIndex 1 (he:ta)


-- rotate a 2d array 180 degrees
oneHundredEightyRotation :: [[Char]] -> [[Char]]
oneHundredEightyRotation maze = clockwiseRotation(clockwiseRotation(maze))

--recombines (1d -> 2d) maze, splits the 1d based on int value
recombine :: Int -> [Char] -> [[Char]]
recombine _ [] = []
recombine cut maze
 | cut > 0 = (take cut maze) : (recombine cut (drop cut maze))
 | otherwise = []

-- retruns the value at a given index position
valueAtIndex :: Int -> [Char] -> Char
valueAtIndex index maze = (!!) maze index


find' :: Eq a => a -> [a] -> [Int]
find' el list = findHelper el list 0

findHelper :: Eq a => a -> [a] -> Int -> [Int]
findHelper _ [] _ = []
findHelper el (he:ta) ind
	   | el == he	= ind:(findHelper el ta (ind+1))
	   | otherwise	= findHelper el ta (ind+1)
