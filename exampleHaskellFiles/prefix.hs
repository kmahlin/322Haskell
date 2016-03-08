prefix :: [a] -> [a]
-- return a list of all, but last element
prefix [_] = []
prefix (he:ta) = he:(prefix ta)