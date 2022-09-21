codeM, codeA :: [Int]
codeM = [6, 2, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4]       -- 1er dia de cada mes 
codeA = [0, 5, 3, 1]                               -- doomsday dia del siglo

biciesto :: Int -> Bool    -- checkeo si es biciesto 
biciesto a = (((mod a 4) == 0) && ((mod a 100) /= 0)) || mod a 400 == 0

leap :: Int -> Int -> Int     -- tomo en cuenta el corrimiento de los dias por año biciesto
leap m a | (biciesto a) && m < 3 = 1 
         | otherwise = 0 

calcA :: Int -> Int                       
calcA a =  (codeA !! siglo) + (div yr 4) + yr  -- me muevo dentro de codeA al siglo en ciclos de 4
    where siglo = mod (div a 100) 4            -- agrego los años biciestos desde el comienzo del siglo
          yr = mod a 100                       -- y la decada

queDiaNum :: Int -> Int -> Int -> Int
queDiaNum d m a = mod calculo 7                                     -- busco el dia de la semana, solo importa cada 
    where calculo = d + (codeM !! (m - 1)) + calcA a - leap m a     -- 7 dias (mod c 7)
{-
en este caso me muevo dentro de codeM para encontrar el mes m - 1 (haskell cuenta desde el 0...)
a ese dia le sumo la cantidad de dias y me voy para atras los dias extras por ser biciesto 

(checkear por que con "+ leap m a" da mal la fecha, con - lo arregle pero a fuerza bruta verificando)
-}


queDiaFue :: Int -> Int -> Int -> String                 -- queria que me devuelva texto, averiguar como sacar las "" de la rta
queDiaFue d m a = ["Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado"] !! queDiaNum d m a 



