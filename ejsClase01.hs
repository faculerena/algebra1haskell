absoluto :: Int -> Int 
absoluto x | x >= 0 = x
           | x < 0 = -x
      
maximo :: Int -> Int -> Int
maximo x y | x >= y = x
           | otherwise = y 

maxAbs0 :: Int -> Int -> Int
maxAbs0 x y = maximo (absoluto x) (absoluto y)

           
max3 :: Int -> Int -> Int -> Int         
max3 x y z | x > y && x > z = x
           | y > x && y > z = y
           | otherwise = z
           
algunoEs0 ::  Float -> Float -> Bool
algunoEs0 x y = x == 0 || y == 0 
              
              

algunoEs00 :: Float -> Float -> Bool
algunoEs00 0 _ = True  
algunoEs00 _ 0 = True
algunoEs00 _ _ = False
 



ambosSon0 :: Float -> Float -> Bool
ambosSon0 x y | x == 0 && y == 0 = True



esMultDe :: Int -> Int -> Bool
esMultDe x y = mod x y == 0


digitoUnit :: Int -> Int
digitoUnit x = mod x 10

digitoDec :: Int -> Int 
digitoDec x = div (mod x 100) 10   --dividir resto de la division por 100 y despues dividirlo por 10

