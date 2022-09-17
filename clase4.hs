sumGauss :: Int -> Int 
sumGauss n | n == 1 = 1 
           | n == 0 = 0
           | otherwise = n + sumGauss(n-1)
       
sum1 :: Int -> Int                 -- (2 a la (n-1) -1 ) / 2 - 1
sum1 n | n == 0 = 1                 -- busco la sum de las potencias de 2 
       | otherwise = 2 ^ n + sum1(n - 1)   


sum2 :: Int -> Int -> Int 
sum2 q n  | n <= 0 = 0
          | otherwise = q ^ n + sum2 q (n - 1)
         
sum3 :: Int -> Int -> Int     
sum3 q n = sum2 q (2 * n)
          

sum4 :: Int -> Int -> Int
sum4 q n = sum2 q (2 * n) - sum2 q (n - 1) 

factorial :: Integer -> Integer
factorial n | n == 0 = 1 
            | n == 1 = 1
            | n > 1 = n * factorial (n-1)

eAprox :: Integer -> Double
eAprox n | n == 0 = 1 
         | otherwise = 1 / (fromIntegral (factorial n)) + eAprox (n - 1) 
         


dobleSum :: Int-> Int -> Int
dobleSum n m | n == 1 = sum2 n 1 
             | otherwise = dobleSum (n - 1) m + sum2 n m  


toInt :: Float -> Int
toInt = round                      -- convierte la entrada Float en un Int


sum5 :: Int -> Int -> Int -> Int
sum5 q a b | b == 1 = q ^ (b + a) 
           | otherwise = sum5 q a (b - 1) + q ^ (a + b)   


sumaPotencias :: Int -> Int -> Int -> Int
sumaPotencias q r s | r == 1 = sum5 q r s     
                    | otherwise = sumaPotencias q (r - 1) s + sum5 q r s
                    
{- "b" y "r" son las variables de la recursion y cambian paso a paso
en sum5 b queda fijo y es el tope de la sumatoria de "adentro" y en
sumaPotencias s queda fijo y es el tope de la sumatoria de "afuera" -}




























