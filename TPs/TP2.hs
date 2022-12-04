-- Bonnier, Jazmin - jazminbonnier@gmail.com
-- Galizia, Antonella - galiziaantonella9@gmail.com
-- Lerena, Facundo - faculerena@gmail.com


type Complejo = (Float,Float) 
type Trig = (Float, Float)

-- 1.1
re :: Complejo -> Float
re (a,b) = a


-- 1.2
im :: Complejo -> Float
im (a,b) = b


-- 1.3
suma :: Complejo -> Complejo -> Complejo
suma (a,b) (c,d) = (a + c, b + d)


-- 1.4
producto :: Complejo -> Complejo -> Complejo
producto (a,b) (c,d) = (a * c - b * d, a * d + b * c)


-- 1.5
conjugado :: Complejo -> Complejo
conjugado (a,b) = (a,-b)

-- 1.6
inverso :: Complejo -> Complejo
inverso (a,b) = (a / mc  , -b / mc )
              where mc = (modulo (a,b))^2

formaTrig :: Complejo -> Trig
formaTrig (a,b) = (r,thita)
              where r = modulo (a,b)
                    thita = argumento (a,b)

-- 1.7
cociente :: Complejo -> Complejo -> Complejo
cociente (0,0) (c,d) = (0,0)
cociente (a,b) (c,d) =  (cmod * rargcos, cmod * rargsin)
                     where cmod = (modulo (a,b)) / (modulo (c,d))
                           rargcos = cos (argumento (a,b) - argumento (c,d))
                           rargsin = sin (argumento (a,b) - argumento (c,d))

-- 1.8
potencia :: Complejo -> Integer -> Complejo
potencia (0,0) k = (0,0)  -- o undefined
potencia (a,b) k =  (kmod * kargcos, kmod * kargsin)
                     where kmod = (modulo (a,b)) ^ k 
                           kargcos = cos ((argumento (a,b)) * (fromInteger k))   
                           kargsin = sin ((argumento (a,b)) * (fromInteger k))   


-- 1.9
raicesCuadratica :: Float -> Float -> Float -> (Complejo,Complejo)
raicesCuadratica a b c | d >= 0 = ((r1,0),(r2,0))
                       | otherwise = ((re,-imabs),(re,imabs))
                       where d = (b^2 - 4*a*c)
                             r1 = (-b - sqrt(d)) / (2 * a)  
                             r2 = (-b + sqrt(d)) / (2 * a)
                             re = -b / (2 * a) 
                             imabs = sqrt(-d) / (2 * a)

-- 2.1
modulo :: Complejo -> Float
modulo (0, 0) = 0 
modulo (a,b) = sqrt (a^2 + b^2) 

-- 2.2
distancia :: Complejo -> Complejo -> Float
distancia (a,b) (c,d) = modulo (suma (a,b) (-c,-d))

-- 2.3
argumento :: Complejo -> Float 
argumento (0,0) = undefined
argumento (a,b) |atan2 b a < 0 = (atan2 b a) + 2*pi
                |otherwise = atan2 b a      

-- 2.4
pasarACartesianas :: Float -> Float -> Complejo
pasarACartesianas r t = (r * cos t, r * sin t)

-- 2.5
raizCuadrada :: Complejo -> (Complejo,Complejo)
raizCuadrada (a,b) | b > 0 = ((-c,-d),(c,d))
                   | b < 0 = ((-c,d),(c,-d))
                   | b == 0 && a > 0 = ((sqrt a,b),(-sqrt a,b))
                   | otherwise = ((b,(sqrt (-a))),(b,-(sqrt (-a))))
                    where c = sqrt ((modulo (a,b) + a) / 2)
                          d = sqrt ((modulo (a,b) - a) / 2)

opuesto :: Complejo->Complejo
opuesto (a,b) = ((-a),(-b))

-- 2.6
raicesCuadraticaCompleja :: Complejo -> Complejo -> Complejo -> (Complejo,Complejo)
raicesCuadraticaCompleja a b c
             |d == (0,0) = (r1,r1)
             |otherwise = (r1,r2)
              where d = fst(raizCuadrada (suma (potencia b 2) (opuesto (producto (4,0) (producto a c)))))
                    p = (producto (2,0) a)
                    ob = opuesto b
                    od = opuesto d 
                    r1 = cociente (suma ob d) p
                    r2 = cociente (suma ob od) p

-- 3.1
raicesNEsimas :: Integer -> [Complejo]
raicesNEsimas n = raicesNEsimasK (fromInteger n) (0)

raicesNEsimasK :: Integer -> Integer -> [Complejo]
raicesNEsimasK n' k' | k == n-1 = [(cos(2 * k * pi / n) , sin(2 * k * pi / n))]
                     | otherwise = raicesNEsimasK n' (k'+1) ++ [(cos(2 * k * pi / n) , sin (2 * k * pi / n))]
                         where n = fromInteger n'             
                               k = fromInteger k'         

-- 3.2

sonRaicesNEsimas :: Integer -> [Complejo] -> Float -> Bool
sonRaicesNEsimas n [] err = True
sonRaicesNEsimas n (r:rs) err | modulo(suma (potencia r n) (-1,0)) < err = sonRaicesNEsimas n rs err
                              | otherwise = False




{- esto lo dejamos por si en el oral piden que corrijamos que [] = false o [] = true
sonRaicesNEsimas :: Integer -> [Complejo] -> Float -> Bool
sonRaicesNEsimas n [] err = False
sonRaicesNEsimas n (r:rs) err = sonRaicesNEsimasAux n (r:rs) err

sonRaicesNEsimasAux :: Integer -> [Complejo] -> Float -> Bool
sonRaicesNEsimasAux n [] err = True
sonRaicesNEsimasAux n (r:rs) err | modulo(suma (potencia r n) (-1,0)) < err = sonRaicesNEsimasAux n rs err
                                 | otherwise = False



-}
