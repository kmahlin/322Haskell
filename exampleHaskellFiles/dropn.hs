
dropn :: Int -> [a] -> [a]
-- drop the first n elements from a list
dropn 0 list = list
dropn _ [] = []
dropn n (he:ta) = dropn (n-1) ta