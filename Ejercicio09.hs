maximo :: Int -> Int -> Int
maximo x y =
    if x > y
       then x
       else y

max3 :: Int -> Int -> Int -> Int
max3 a b c = maximo (maximo a b) c