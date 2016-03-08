






ourApply :: (a->b) -> [a] -> [b]
ourApply _ [] = []
ourApply f (he:ta) = (f he):(ourApply f ta)