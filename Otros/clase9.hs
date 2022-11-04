
division :: Int -> Int -> (Int, Int)
division a d | a < d = (0,a)
             | otherwise = (fst (division (a-d) d) + 1, snd (division (a-d) d))
             
             

division1 :: Int -> Int -> (Int, Int)
division1 a d | a > d = (0,a)
              | otherwise = (-1+q, r)
                 where (q,r) = division1 (a+d) d
                 
                 
                 
mcd :: Int -> Int -> Int
mcd n m | m == 0 = n
        | otherwise = mcd m (snd(division n m)) 
        
        
 {-       
menorDivDesde :: Integer -> Integer -> Integer
menorDivDesde n m | mod n m == 0 = m
                  | otherwise = menorDivDesde n (m + 1)

menorDiv :: Integer -> Integer
menorDiv 1 = 1
menorDiv n = menorDivDesde n 2


mcd1 :: Int -> Int -> Int
mcd1 a b | mcd1 1 b = 1
         | mcd1 a 1 = 1 
         | d == e = d * mcd1 (division a d) (division b d)
         | otherwise = mcd1 (division a d) b
         where d = menorDiv a
               e = menorDiv b
            -}   
               
emcd :: Int -> Int -> (Int,Int,Int)
emcd a 0 = (a,1,0)
emcd a b = (g,s,t)
          where (_,s',t') = emcd b r
                g = s' * b + t' * r
                s = t'
                t = s' - (t' * q)
                q = div a b
                r = mod a b           
