diviPos :: Int -> Int -> (Int,Int)
diviPos a d | a < d = (0, a)
            | otherwise = (fst q + 1, snd q)
              where q = diviPos (a-d) d
          
diviNeg :: Int -> Int -> (Int,Int)
diviNeg a d | a < d && a >= 0 = (0, a)
            | otherwise = ((fst q - 1), snd q)
              where q = diviNeg (a+d) d
              
{-| esto esta bien pero habia que implementar todo en una sola funcion
divigeneral :: Int -> Int -> (Int,Int) 
divigeneral a d | a > 0 = diviPos a d
                | otherwise = diviNeg a d -}

divi :: Int -> Int -> (Int,Int)     --asume d positivo
divi a d | a < d && a >= 0 = (0, a)  --caso base
         | a > 0 && d > 0 = (fst q1 + 1, snd q1)
         | a < 0 && d < 0 = (abs (fst q3 + 1), snd q3)
         | a > 0 && d < 0 = (-fst q4, snd q4)
         | otherwise = (fst q2 - 1, snd q2)
             where q1 = divi (a-d) d
                   q2 = divi (a+d) d
                   q3 = divi ((abs a) + (abs d)) d 
                   q4 = divi a (-d) 
                   
mcdmod :: Int -> Int -> Int
mcdmod x 0 = x
mcdmod x y = mcdmod y (mod x y) 

mcd :: Int -> Int -> Int
mcd x 0 = x
mcd x y = mcd y (snd(divi x y))

cocEntero :: Int -> Int -> Int
cocEntero n m = fst(divi n m)

resto :: Int -> Int -> Int
resto n m = snd(divi n m)

mcd2 :: Int -> Int -> Int --version lenta del mcd
mcd2 a 1 = 1
mcd2 1 b = 1
mcd2 _ 0 = 0
mcd2 0 _ = 0
mcd2 a b | menorDiv a == menorDiv b = (menorDiv a)  * (mcd (div a (menorDiv a)) (div b (menorDiv b)))
         | otherwise = mcd (div a (menorDiv a)) b 

--funciones de otra clase-----------------------------------

menorDivDesde :: Int -> Int -> Int
menorDivDesde n m | mod n m == 0 = m
                     | otherwise = menorDivDesde n (m + 1)

menorDiv :: Int -> Int
menorDiv 1 = 1
menorDiv n = menorDivDesde n 2

fst3 (x, _, _) = x
snd3 (_, y, _) = y 
trd3 (_, _, z) = z

-- ---------------------------------------------------------
{-
esta version usa div y mod y tarda abismalmente menos
emcdG :: Int -> Int -> (Int, Int, Int)
emcdG a 0 = (a, 1, 0)
emcdG a b = (g, s, t)
          where (_, s',t') =  emcdG b r
                g = (s' * b) + (t' * r) 
                s = t'
                t = s'- (t' * q)
                q = div a b
                r = mod a b 
-}

emcd :: Int -> Int -> (Int, Int, Int)
emcd a 0 = (a, 1, 0)
emcd a b = (g, s, t)
          where (_, s',t') =  emcd b r
                g = (s' * b) + (t' * r) 
                s = t'
                t = s'- (t' * q)
                q = cocEntero a b
                r = resto a b 




