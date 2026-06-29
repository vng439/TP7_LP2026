factorial :: Int -> Int
factorial n = factorialAux n 1

factorialAux :: Int -> Int -> Int
factorialAux 0 acc = acc
factorialAux n acc = factorialAux (n - 1) (n * acc)