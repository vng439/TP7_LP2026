par :: Int -> Bool
par 0 = True
par n = impar (n - 1)

impar :: Int -> Bool
impar 0 = False
impar n = par (n - 1)