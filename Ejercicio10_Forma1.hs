maximo :: Int -> Int -> Int
maximo x y =
    if x > y
       then x
       else y

max4 :: Int -> Int -> Int -> Int -> Int
max4 a b c d = maximo (maximo a b) (maximo c d)