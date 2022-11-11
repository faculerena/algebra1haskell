prodInt :: (Float, Float)-> (Float, Float) -> Float
prodInt (x1, y1) (x2, y2) = x1 * x2 + y1 * y2

todoMenor :: (Float, Float)-> (Float, Float) -> Bool
todoMenor (x1, y1) (x2, y2) = x1 < x2 && y1 < y2 

distanciaPuntos :: (Float, Float)-> (Float, Float) -> Float
distanciaPuntos (x1, y1) (x2, y2) = sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)

sumaTerna :: Int -> Int -> Int -> Int
sumaTerna x y z = x + y + z

posicPrimerPar :: Int -> Int -> Int -> Int
posicPrimerPar x y z | mod x 2 == 0 = 1
                     | mod y 2 == 0 = 2
                     | mod y 3 == 0 = 3
                     |otherwise = 4

crearPar :: t -> u -> (t, u)
crearPar a b = (a, b)

invertirPar :: (t, u) -> (u, t)
invertirPar (a, b) = (b, a)

estanRelacionados :: Float -> Float -> Bool
estanRelacionados x y = (x <= 3 && y <= 3) || (3 < x && x <= 7 && 3 < y && y <= 7) || (x > 7 && y > 7)   

