emcd :: Int -> Int -> (Int, Int, Int)                      -- ver ejsClase9
emcd a 0 = (a, 1, 0)
emcd a b = (g, s, t)
          where (_, s',t') =  emcd b r
                g = (+) (s' * b) (t' * r) 
                s = t'
                t = s'- (t' * q)
                q = div a b
                r = mod a b 

fst3 (x, _, _) = x
snd3 (_, y, _) = y 
trd3 (_, _, z) = z


tieneSol :: Int -> Int -> Int -> Bool                     -- una eq de congruencia tiene sol si 
tieneSol a b c = mod c (gcd a b) == 0 


congruenciaPart :: Int -> Int -> Int -> (Int, Int)
congruenciaPart a b c | tieneSol a b c == False = undefined   -- si no tiene la descarto
                      | gcd a b == c = (s, t)              -- si el resultado que busco es el mcd 
                      | otherwise = (md * s, md *t)        -- sino la escalo linealmente
                       where (_,s,t) = (emcd a b)
                             md = div c (gcd a b)
                        
                        
congruencia :: Int -> Int -> Int -> (Int, Int)
congruencia a b c = (x, div c (gcd a c))
                    where x = fst (congruenciaPart a c b) 
