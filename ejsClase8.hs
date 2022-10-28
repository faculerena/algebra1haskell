type Set a = [a]

vacio :: Set Int
vacio = []

agregar :: (Eq a) => a -> Set a -> Set a
agregar a bs | not (elem a bs) = a:bs
             | otherwise = bs 

incluido :: (Eq a) => Set a -> Set a -> Bool
incluido [] _ = True
incluido (a:as) (b:bs) | elem a (b:bs) = incluido as (b:bs)
                       | otherwise = False

agregarATodos :: Int -> Set (Set Int) -> Set (Set Int)
agregarATodos a [] = []
agregarATodos a (b:bs) = (a:b):(agregarATodos a bs)

agregarTodosATodos :: Set Int -> Set (Set Int) -> Set (Set Int) 
agregarTodosATodos [] _ = []
agregarTodosATodos (a:as) (b:bs) = agregarATodos a (b:bs) ++ agregarTodosATodos as (b:bs)



 -- -----------------------------------------------------------------------

combinatorio :: Int -> Int -> Int 
combinatorio n m | m > n = 0
                 | m == n || m == 0 = 1
                 | otherwise = combinatorio (n-1) m + combinatorio (n-1) (m-1)
           
variaciones :: Set Int -> Int -> Set [Int]
variaciones _ 0 = [[]]
variaciones [] _ = []
variaciones (a:as) l = agregarTodosATodos (a:as) (variaciones (a:as) (l-1))  


insertarEn ::  [a] -> a -> Int -> [a]
insertarEn [] e i = [e]
insertarEn (x:xs) e i | i == 1 = e : x : xs  
                      | otherwise  = x : insertarEn xs e (i - 1)

permutaciones :: Int -> Set [Int]
permutaciones 0 = [[]]
permutaciones n = insertarATodosEnTodosLados n (permutaciones (n-1)) 


insertarATodosEnTodosLados :: Int -> Set [Int] -> Set [Int]
insertarATodosEnTodosLados _ [] = []
insertarATodosEnTodosLados n ([]:pss) = [n]:(insertarATodosEnTodosLados n pss)
insertarATodosEnTodosLados n (ps:pss) = (insertarEnTodosLados n ps n) ++ (insertarATodosEnTodosLados n pss)


insertarEnTodosLados :: Int -> [Int] -> Int -> Set [Int]
insertarEnTodosLados n ps i | i == 0 = []
                            | otherwise = (insertarEn ps n i) : (insertarEnTodosLados n ps (i - 1))











