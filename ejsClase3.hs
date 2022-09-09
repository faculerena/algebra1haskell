factorial :: Integer -> Integer
factorial n | n == 0 = 1 
            | n > 1 = n * factorial (n-1)


      
esPar :: Int -> Bool
esPar n | n == 0 = True
        | n == 1 = False
        | otherwise = esPar (n-2)
        
fib :: Int -> Int 
fib n | n == 0 = 0
      | n == 1 = 1
      | otherwise = fib(n-1) + fib(n-2)

{-
toInt :: Float -> Int                        Esto tiene que tener algun truco para pasar 
toInt n | n >= 0 && n < 1 = 0 	      de float a int/integer
 -}

parteDecimal :: Float -> Float
parteDecimal n | n < 1 && n >= 0 = n
               | n < 0 = 0  
               | otherwise = parteDecimal(n-1)

parteEntera :: Float -> Float
parteEntera n | n > 0 = (n - parteDecimal(n))
              | otherwise = 0

div3 :: Int -> Bool
div3 n | n < 3 = False
       | n == 3 = True
       | otherwise = div3(n-3)


sumaImpares :: Int -> Int
sumaImpares n | n == 1 = 1                  --1 + 3 + 5 + 7 + 9
              | otherwise =  (2 * n - 1) + sumaImpares(n-1)

mediofact :: Int -> Int
mediofact n | n == 0 = 1 
            | n == 1 = 1
            | n >= 2 = n * mediofact (n-2)
            
-- traigo una func de la clase 1

digitoUnit :: Int -> Int
digitoUnit x = mod x 10


digitoDec :: Int -> Int 
digitoDec x = div (mod x 100) 10 

-- listo


sumDig :: Int -> Int
sumDig n | n >= 0 && n < 10 = digitoUnit(n) 
         | otherwise = (digitoUnit(n) + sumDig(div n 10))
            
            
digIguales :: Int -> Bool 
digIguales n | mod n 10 == 0 = False 
             | (d == 1) && div n 100 == 0 = True  
             | (d == 1) && div n 100 /= 0 = digIguales(div n 10)
             | otherwise = False
            where d = div (digitoDec n) (digitoUnit n) 
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
      

