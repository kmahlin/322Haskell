




ourQuickSort :: Ord a => [a] -> [a]
ourQuickSort [] = []
ourQuickSort (el:els) = leqs ++ [el] ++ gts
	     where leqs = ourQuickSort [x|x<-els,x<=el]
	     	   gts	= ourQuickSort [y|y<-els,y>el]