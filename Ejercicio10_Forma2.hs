maximo :: Int -> Int -> Int
maximo x y =
    if x > y
       then x
       else y
       
max4b :: Int -> Int -> Int -> Int -> Int
max4b a b c d = maximo a (maximo b (maximo c d))