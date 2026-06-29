ordenar3 :: Int -> Int -> Int -> (Int, Int, Int)
ordenar3 a b c
    | a <= b && b <= c = (a,b,c)
    | a <= c && c <= b = (a,c,b)
    | b <= a && a <= c = (b,a,c)
    | b <= c && c <= a = (b,c,a)
    | c <= a && a <= b = (c,a,b)
    | otherwise = (c,b,a)