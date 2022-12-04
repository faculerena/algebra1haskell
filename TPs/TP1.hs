-- Apellido Nombre #1
-- Apellido Nombre #2
-- Apellido Nombre #3

-- Antes de entregar, hay que limpiar los comentarios a lo minimo y necesario.

-- EJERCICIO 1. sonCoprimos

{-
 a (natural) es coprimo con b (natural, primo) sii b divide (a^(b-1)) - 1, entonces dados a y b, si mod a [(a^(b-1)) -1] = 0 son coprimos

 parece que eso no funciona porque (a^(b-1)) - 1 puede ser 0 y genera division por 0, no nos dejemos cagar por eso en el oral

 con verificar que el mayor multiplo (y unico, creo que la demostracion esta en la teorica de teresa) que tienen en comun es 1 sabemos que son coprimos

 HABRIA que chequear que b es primo
-}
menorDivDesde :: Integer -> Integer -> Integer
menorDivDesde n m | mod n m == 0 = m
                  | otherwise = menorDivDesde n (m + 1)

menorDiv :: Integer -> Integer
menorDiv 1 = 1
menorDiv n = menorDivDesde n 2


esPrimo :: Integer -> Bool
esPrimo n = menorDiv n == n

mcd :: Integer -> Integer -> Integer --Algoritmo euclideo para mcd, recursivo: sean a, b dos numeros enteros
mcd x 0 = x                          --mod a b = r, realizar la funcion de manera recursiva con a = b y b = r, repetir hasta
mcd x y = mcd y (mod x y)            --que de 0


sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos a b = mcd a b == 1 


{-
 Atencion: Segun la consigna del TP1, p deberia ser primo para cumplir la condicion de coprimo
 "Sea p un número primo positivo. Entonces, para todo número natural a coprimo con p, p divide a a^(p−1) − 1" 
 Pero en el ejercicio de ejemplo donde aplican la funcion a 1007 y 1474 (ambos numeros compuestos) resulta TRUE
 en el caso de que sea necesario verificar que sea primo (por alguna correccion de un profesor antes de la entrega o en el coloquio) esto lo resuelve


 sonCoprimos2 :: Integer -> Integer -> Bool
 sonCoprimos2 a b = esPrimo b && mcd a b == 1 = True
                 


 Intento fallido

 sonCoprimos0 :: Integer -> Integer -> Bool
 sonCoprimos0 a p = mod p ((a ^ (p - 1)) - 1)  == 0
-}




-- EJE3RCICO 2: es2Pseudoprimo
es2Pseudoprimo :: Integer -> Bool
es2Pseudoprimo a = mod b a == 0  && not (esPrimo a)   -- este fue demasiado facil no? siento que hay algo mal
                where b = ((2 ^ (a - 1)) - 1)



-- EJERCICIO 3: cantidad3Pseudoprimos
{-
 aca basicamente necesitamos una variable que funcione como contador, i vaya pasando del 1 hasta m y cada vez que ve un 3pseudoprimo
 aumenta el (c) contador en 1, cuando da m pasos, devolver el contador que recorre el intervalo [1..m]
-}

esNPseudoprimo :: Integer -> Integer -> Bool
esNPseudoprimo a n = mod b a == 0 && not (esPrimo a)     -- no la pide pero es la funcion general de N-Pseudoprimos, es comodo para usarla
                where b = ((n ^ (a - 1)) - 1)            -- los N-PseudoPrimos SON COMPUESTOS hay que chequear not esPrimo, lo agrego en es2Pseudoprimo


cantidad3PseudoprimosHasta :: Integer -> Integer -> Integer -> Integer
cantidad3PseudoprimosHasta m c i | m == i - 1 = c -- se fija si ya llegaste a dar m pasos, le resta 1 a i porque si m es 3-Pseudoprimo va hasta el segundo renglon
                                 | esNPseudoprimo i 3 = cantidad3PseudoprimosHasta m (c + 1) (i + 1)  
                                 | otherwise = cantidad3PseudoprimosHasta m c (i + 1)

cantidad3Pseudoprimos :: Integer -> Integer
cantidad3Pseudoprimos m = cantidad3PseudoprimosHasta m 0 1     --empezando con 0 3-Pseudoprimos en el contador, empezando a recorrer el intervalo [1..m]


-- EJERCICIO 4: kesimo2y3Pseudoprimo

kesimo2y3PseudoprimoDesde :: Integer -> Integer -> Integer -> Integer
kesimo2y3PseudoprimoDesde m k i | k == m = i - 1          -- cuando el contador k llega a mi valor deseado m, devuelve i-1 para corregir el indice que sufre la recurrencia 
                                | (esNPseudoprimo i 2 && esNPseudoprimo i 3) = kesimo2y3PseudoprimoDesde m (k + 1) (i + 1)
                                | otherwise = kesimo2y3PseudoprimoDesde m k (i + 1)


{-
 checkeo que i sea 2Pseudoprimo y 3Pseudoprimo (&& puerta logica AND, si las dos son false tambien da true asi que se pide que ambas sean TRUE)
 si lo es, agrego al contador que vi un numero de los que queria y sigo moviendo i
 cuando k me dice que ya vi m valores, devuelvo i - 1 para corregir por el movimiento de i que generan las funciones de la | 2 y 3
-}

kesimo2y3Pseudoprimo :: Integer -> Integer
kesimo2y3Pseudoprimo n = kesimo2y3PseudoprimoDesde n 0 1



-- EJERCICIO 5: esCarmichael
-- aca hay que usar la funcion de esNPseudoprimo seguro

{-
 c es carmichael si es compuesto y a-pseudoprimo para todo a coprimo con c en [1..c-1],  a es la base de carmichael que se mueve entre 1 y c-1 
 en el intervalo [1..c-1] va a haber numeros coprimos con c, vamos a decirles basesCarmichel con elementos car1 car2...
 si carN es carN-Pseudoprimo, entonces c es un numero de carmichael


 hay que ver cuantos numeros coprimos con c hay hasta c-1 [Coprimos en 1..c-1]
 despues hay que ver que de todos esos numeros, c sea c_n-Pseudoprimos 
 si #[Coprimos en 1..c-1] = #[c es c_n-Pseudoprimo] Y c no es primo, entonces c es un numero de carmichael

-}

esCarmichaelAux :: Integer -> Integer -> Bool        
esCarmichaelAux n i | (not (esPrimo n) && n - 1 == i) = True
                    | not (sonCoprimos n i) = esCarmichaelAux n (i + 1)  --pasamos de largo los que no son coprimos con n
                    | (sonCoprimos n i && esNPseudoprimo n i) == True = esCarmichaelAux n (i + 1)  --nos fijamos que n i sean coprimos y n sea i-pseudoprimo
                    | otherwise = False  --sino, no es carmichael 
                       
 

esCarmichael :: Integer -> Bool
esCarmichael c = esCarmichaelAux c 1





{-
coprimosde :: Integer -> [Integer]              la genere solo para probar y darnos cuenta que era necesario saltear los i no coprimos con n
coprimosde n = [x | x <- [1..(n)],  sonCoprimos x n]

[1,2,4,5,7,8,10,13,14,16,19,20,23,25,26,28,29,31,32,35,37,38,40,41,43,46,47,49,50,52,53,56,58,59,61,62,64,65,67,70,71,73,74,76,79,80,82,83,86,89,91,92,94,95,97,98,100,101,103,104,106,107,109,112,113,115,116,118,122,124,125,127,128,130,131,133,134,137,139,140,142,145,146,148,149,151,152,155,157,158,160,161,163,164,166,167,169,172,173,175,178,179,181,182,184,185,188,190,191,193,194,196,197,199,200,202,203,205,206,208,211,212,214,215,217,218,223,224,226,227,229,230,232,233,235,236,239,241,244,245,247,248,250,251,254,256,257,259,260,262,263,265,266,268,269,271,274,277,278,280,281,283,284,287,290,292,293,295,296,298,299,301,302,304,305,307,310,311,313,314,316,317,320,322,325,326,328,329,331,332,334,335,337,338,343,344,346,347,349,350,353,355,356,358,359,361,362,364,365,367,368,370,371,373,376,377,379,380,382,383,386,388,389,392,394,395,397,398,400,401,403,404,406,409,410,412,413,415,416,419,421,422,424,427,428,430,431,433,434,436,437,439,443,445,446,448,449,452,454,455,457,458,460,461,463,464,466,467,469,470,472,475,478,479,481,482,485,487,488,490,491,494,496,497,499,500,502,503,505,508,509,511,512,514,515,518,520,521,523,524,526,529,530,532,533,535,536,538,541,542,545,547,548,551,553,554,556,557,559,560]

-}