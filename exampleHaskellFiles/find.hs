find :: Eq a => a -> [a] -> [Int]
find el list = findHelper el list 0

findHelper :: Eq a => a -> [a] -> Int -> [Int]
findHelper _ [] _ = []
findHelper el (he:ta) ind
	   | el == he	= ind:(findHelper el ta (ind+1))
	   | otherwise	= findHelper el ta (ind+1)