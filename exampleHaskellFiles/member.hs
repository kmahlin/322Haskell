member :: Eq a => a -> [a] -> Bool
member _ []    	  = False
member el (he:ta) = (el == he) || (member el ta)