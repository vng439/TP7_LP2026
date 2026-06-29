miNot :: Bool -> Bool
miNot True = False
miNot False = True

miAnd :: Bool -> Bool -> Bool
miAnd True True = True
miAnd _ _ = False

miOr :: Bool -> Bool -> Bool
miOr False False = False
miOr _ _ = True

miXor :: Bool -> Bool -> Bool
miXor True False = True
miXor False True = True
miXor _ _ = False


miAnd2 :: Bool -> Bool -> Bool
miAnd2 x y =
    if x == True && y == True
       then True
       else False