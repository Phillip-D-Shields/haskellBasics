-- exercise 1
pyths :: Int -> [(Int,Int,Int)]
pyths z = [(x,y,z) | x <- [1..z], y <- [1..z], x^2 + y^2 == z^2]

-- exercise 2 
factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], sum (init (factors x)) == x ]
-- init drops the last element, without it sum will never match n
-- without init factors 6 => [1,2,3,6] sum = 12
-- with init => [1,2,3] sum = 6

-- alternative solution 
perfect :: Int -> Bool 
perfect n = sum (init(factors n)) == n

perfects' :: Int -> [Int]
perfects' n = [x | x <- [1..n], perfect x]

-- exercise 3
scalarProduct :: [Int] -> [Int] -> Int 
scalarProduct xs ys = sum [x*y | (x,y) <- zip xs ys]

-- alternative solution (solutions assume there are two equal length lists)
sp :: [Int] -> [Int] -> Int 
sp xs ys = sum [xs !! i * ys !! i | i <- [0..n-1]]
            where n = length xs