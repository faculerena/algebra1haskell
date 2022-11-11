type Set a = [a]   --renombramos el tipo de dato lista a Set, hablando de conjuntos


vacio :: Set Int
vacio = [] --definimos el conjunto vacio 

agregar :: (Eq a) => a -> Set a -> Set a     --agregamos un elemento "a" al conjunto "bs"
agregar a bs | not (elem a bs) = a:bs
             | otherwise = bs 

incluido :: (Eq a) => Set a -> Set a -> Bool  --verificamos que un conjunto este incluido en otro
incluido [] _ = True                --caso base
incluido (a:as) (b:bs) | elem a (b:bs) = incluido as (b:bs)  --si el primer elemento esta, verifico si el conjunto sin el primero tambien esta
                       | otherwise = False  --sino no


agregarATodos :: a -> Set (Set a) -> Set (Set a)
agregarATodos a [] = []                                  --agregamos un elemento "a" a todos los elem de la lista
agregarATodos a (b:bs) = (a:b):(agregarATodos a bs)


partes :: Int -> Set (Set Int)
partes 0 = [[]]
partes n =  partes (n-1) ++ (agregarATodos n (partes (n-1)))

--Producto cartesiano, tengo 2 o 3 maneras de como hacerlo:

--Implementacion 0: la que no se ve en clase pero sirve para verificar

cartProd0 :: Set a -> Set b -> Set (a, b)
cartProd0 x y = [(a,b) | a <- x, b <- y]

--Implementacion 1: la "fea" que no dieron en clase (doble recursion, reveer temas de doble sumatoria)

prodCart :: Set a -> Set a -> Set (a, a)
prodCart _ [] = []
prodCart [] _ = []
prodCart (x:xs) (y:ys) = (x,y) : (prodCart [x] ys  ++ prodCart xs ys ++  prodCart xs [y])

{-
implementacion que dieron en clase (comentada para que no compile, a mi parecer es mejor la anterior)


prodCart :: Set Int -> Set Int -> Set (Int, Int)
prodCart _ [] = []
prodCart (x:xs) ys = agregarATodos x ys ++ prodCart (xs ys)

-}