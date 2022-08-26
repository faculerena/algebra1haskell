doble :: Int -> Int
doble x = 2 * x 

f x y = x * x + y * y
g x y z = x + y + z * z


suma :: Float -> Float -> Float
suma x y = x + y 
normaVectorial x1 x2 = sqrt(x1 ** 2 + x2 ** 2) --dist al origen
funcionCte8 x = 8 --siempre da 8


normaVect x1 x2 = sqrt(suma (x1 * x1) (x2 * x2))

-- funcion por partes

f1 n | n == 1 = 1 -- si es 1 da 1 sino 0
     | n /= 0 = 0 
    
    
f2 n | n == 0 = 1
     | otherwise = 0


maximo x y | x >= y = x
           | otherwise = y 
           


ff1 n | n >= 3 = 5
      | otherwise = 10
  
      
f4 n | n >= 3 = 5    -- las barras tienen orden y lee de arriba a abajo, devuelve la 1ra satisfecha
     | n <= 9 = 7
    
f5 n | n <= 9 = 7
     | n >= 3 = 5 
     
     
     
h 0 = 1
h n = 0


cantidadSoluc b c | b ** 2  - 4 * c == 2 = 2
                  | b * b - 4 * c == 0 = 1 --chequea discriminante
                  | otherwise = 0 
                  
cantSoluc b c | d > 0 = 2
              | d == 0 = 1
              | otherwise = 0
              where d = (b * b) - (4 * c)
              
              
triple x = 3 * x 



maximo2 :: Int -> Int -> Int
maximo2 x y | x >= y = x
           | otherwise = y 



funcRara1 :: Float -> Float -> Bool -> Bool
funcRara1 x y z = (x >= y) || z

funcRara2 :: Float -> Float -> Bool -> Bool
funcRara2 x y True = True
funcRara2 x y False = x >= y
































