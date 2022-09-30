list0 = [-100..1]
list1 = [x | x <- [-20..20], mod x 4 == 1]
list01 = [-19,-15..20]
list2 :: [Int]
list2 = [1..100]
list3 = [1,0..(-100)]

sumatoriaList :: [Int] -> Int
sumatoriaList a | a == [] = 0 
                | otherwise = head a + sumatoriaList( tail a ) 
                
 {-         
longAux :: [Int] -> Int -> Int
longAux a n | tail a == [] = n + 1
            | otherwise = longAux (tail a) (n + 1)
-}

longitud :: (Eq a) => [a] -> Int
longitud a | a == [] = 0
           | otherwise = longitud ( tail a ) + 1 


perteneceALista :: (Eq a) => a -> [a] -> Bool
perteneceALista a b | b == [] = False
                    | a == head b = True
                    | otherwise = perteneceALista a ( tail b ) 
                    
-- las funciones con una P al final estan hechas con pattern matching
-- las funciones tienen signatura de (Eq a) - Ver clase 2
               
                    
sumatoriaListaP :: [Int] -> Int                    
sumatoriaListaP [] = 0 
sumatoriaListaP ( x : xs ) = sumatoriaListaP xs + x 


longitudP :: (Eq a) => [a] -> Int
longitudP [] = 0
longitudP ( _ : xs) = 1 + longitud xs

perteneceAListaP :: (Eq a) => a -> [a] -> Bool
perteneceAListaP _ [] = False
perteneceAListaP a ( x : xs ) | a == x = True
                              | otherwise = perteneceAListaP a xs 
                         
                              
productoria :: [Int] -> Int
productoria a | longitud a == 0 = 1
              | otherwise = ( head a ) * ( productoria ( tail a ))
                              

sumarN :: Int -> [Int] -> [Int]
sumarN _ [] = []
sumarN n (l:ls) = (( l + n ) : sumarN n ls )

sumarPrimero :: [Int] -> [Int]
sumarPrimero ( x : xs ) = sumarN x ( x : xs )

ultimo :: [Int] -> Int
ultimo ( x : []) = x 
ultimo ( _ : xs) = ultimo xs     


sumarUltimo :: [Int] -> [Int]
sumarUltimo xs = sumarN (ultimo xs) xs 


pares :: [Int] -> [Int]
pares [] = []
pares (x:xs) | mod x 2 == 0 = (x : pares xs)
             | otherwise = pares xs



multiplosN :: [Int] -> [Int]
multiplosN [] = []
multiplosN(x:xs) | mod x 2 == 0 = (x : pares xs)
             | otherwise = pares xs












































