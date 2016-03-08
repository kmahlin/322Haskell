



myGCD :: Integer -> Integer -> Integer
myGCD a b
      | ( a == b ) = a
      | ( a >  b ) = myGCD (a-b) b
      | otherwise  = myGCD (b-a) a