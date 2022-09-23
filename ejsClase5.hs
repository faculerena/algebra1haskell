sumaDivisoresHasta :: Int -> Int -> Int
sumaDivisoresHasta num tope | tope == 1 = 1
                            | mod num tope == 0 = tope + sumaDivisoresHasta num (tope - 1)
                            | mod num tope /= 0 = sumaDivisoresHasta num (tope - 1)

{-
calculo los divisores, e.g. m con tope n, me fijo el resto de (m n) y si es 0 sumo el tope y pruebo n-1 recursivamente (n es divisor)
si n no es divisor, ignoro ese n y pruebo n-1 recursivo  
-}

sumaDivisores :: Int -> Int 
sumaDivisores num = sumaDivisoresHasta num num

{-

NO ENTRA EN EL TP
NO LO HAGAS ASI
-}

divisores :: Int -> [Int]
divisores n = [x | x <- [1..(n)], mod n x == 0]

sumDiv :: Int -> Int
sumDiv n = sum (divisores n) 

{-
Hasta aca
-}

menorDivDesde :: Int -> Int -> Int
menorDivDesde n m | mod n m == 0 = m
                  | otherwise = menorDivDesde n (m + 1)

menorDiv :: Int -> Int
menorDiv 1 = 1
menorDiv n = menorDivDesde n 2


esPrimo :: Int -> Bool
--esPrimo n = sumaDivisores n == (n + 1)
esPrimo n = menorDiv n == n


esPrimoDesde n | sumaDivisores n == (n + 1) = n 
               | otherwise = esPrimoDesde (n + 1)
           
nEsimoPrimoDesde :: Int -> Int -> Int -> Int
nEsimoPrimoDesde n c p | c == n = p - 1
                       | esPrimo p = nEsimoPrimoDesde n (c + 1) (p + 1)
                       | otherwise = nEsimoPrimoDesde n c (p + 1)
                       
nEsimoPrimo :: Int -> Int
nEsimoPrimo n = nEsimoPrimoDesde n 0 2

fac 0 = 1
fac 1 = 1
fac n = n * fac (n-1)

{-
esFactorial :: Int -> Int -> Bool
esFactorial n i | n == factorial i = True
                | n <= factorial i = False
                | otherwise = esFactorial n (i + 1)
-}
menorFactDesdeI :: Int -> Int -> Int
menorFactDesdeI n k | n > fac k  = fac (k + 1)
                    | n <= fac k = 
                    


