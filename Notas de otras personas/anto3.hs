factorial :: Int -> Int
factorial n 
    | n == 0 = 1
    | otherwise = n * factorial (n-1)
    
    
factorial1 :: Int -> Int                      --Factorial con pattern matching
factorial1 0 = 1
factorial1 n = n * factorial (n-1)


esPar :: Int -> Bool
esPar n 
    | n == 0 = True
    | n == 1 = False 
    | otherwise = esPar (n-2)
    
    
fib :: Int -> Int
fib n 
    | n == 0 = 0
    | n == 1 = 1
    | otherwise = fib (n-1) + fib (n-2) 
    

parteDecimal :: Float -> Float
parteDecimal n
    | n >= 0 && n < 1 = n
    | otherwise = parteDecimal (n-1)
 

parteEntera :: Float -> Float
parteEntera n
    | n >= 0 = n - (parteDecimal n) 
    

funcionMultiplo :: Int -> Bool
funcionMultiplo n
    | n == 0 = True
    | n == 1 = False
    | n == 2 = False
    | otherwise = funcionMultiplo (n-3) 
    
    
sumaImpares :: Int -> Int
sumaImpares n
    | n == 1 = 1
    | otherwise = sumaImpares(n-1) + (2 * n-1)
    

medioFact :: Int -> Int 
medioFact n
    | n == 0 && n == 1 = 1
    | otherwise = n * medioFact(n-2)
    
    
sumaDigitos :: Int -> Int 
sumaDigitos n  
    | n == 0 = 0
    | n > 0 && n < 10 = n 
    | otherwise = mod n 10 + sumaDigitos(div n 10 )
    
   
digitosIguales :: Int -> Bool
digitosIguales n 
    | n >= 0 && n < 10 = True
    | mod n 10 == mod (div n 10) 10 = digitosIguales(div n 10)
    | otherwise = False
    
  
    
    
    
