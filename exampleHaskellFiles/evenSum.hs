evenSum :: [Int] -> Int
-- return the sum of the even values in the list
evenSum [] = 0
evenSum (he:ta)
	| (mod he 2) == 0 = he + (evenSum ta)
	| otherwise  	  = evenSum ta