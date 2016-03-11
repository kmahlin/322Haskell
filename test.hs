import Prelude
import Data.Char
import Data.List



-- This method has a lot going on. What it does is :
-- takes a maze, then rotates it counterClockwiseRotation so cols are now rows
-- then flattens the maze (2d -> 1d), and moves every player in the flattened maze
-- then recombines (1d -> 2d) maze, which splits the 1d based on col value
-- then rotates the 2d maze back to orginal position
-- returns 2d maze
makeMove :: [[Char]] -> [Char] -> ([[Char]] , [Char])
makeMove maze tfList = (clockwiseRotation (recombine cols (moveAllPlayers playerOrd ccFlatten tfList)), tfList)
 where
   cc        = counterClockwiseRotation (maze)
   ccFlatten = flatten (cc)
   cols      = length (head cc)
   playerOrd =  getPlayersOrd [] ccFlatten

inGoal :: [Char] -> Bool
inGoal goalList
	| inGoal == True = True
	| otherWise 		 = False
	where
		inGoal = find' 't' goalList

-- takes a flattened array
-- will use movePlayer, but will take a [char], return [char]
-- Takes an empty list and a  flattned maze
-- retruns a list of all players on the board
moveAllPlayers :: [Char] -> [Char] -> [Char] -> ([Char], [Char])
moveAllPlayers [] maze tfList      			 = (maze, tfList)
moveAllPlayers (he:ta) maze tfList   = (moveAllPlayers ta (movePlayer he maze tfList), tfList)


-- move player forward
-- returns a maze of the moved player
movePlayer :: Char -> [Char] -> [Char] -> ([Char], [Char])
movePlayer _ [] _ = []
movePlayer player (he:ta) tfList
  | he == player && val == '-'   = ('-' : movePlayer player ( player : tail ta ), 'f':tfList)
  | he == player && val == 'g'   = ('-' : he : movePlayer player ( tail ta), 't':tfList)
  | otherwise                    = (he  : movePlayer player ta, 'f':tfList)
  where
    val = valueAtIndex 1 (he:ta)
