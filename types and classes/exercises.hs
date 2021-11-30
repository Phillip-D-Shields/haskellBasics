-- find the types

ex1 :: [Char]
ex1 = ['a','b','c']

ex2 :: (Char, Char, Char)
ex2 = ('a','b','c')

ex3 :: [(Bool, Char)]
ex3 = [(False, '0'),(True, '1')]

ex4 :: ([Bool], [Char])
ex4 = ([False,True],['0','1'])

ex5 :: [[a] -> [a]]
ex5 = [tail, init, reverse]

second :: [a] -> a
second xs = head (tail xs)

swap :: (b, a) -> (a, b)
swap (x,y) = (y,x)

pair :: a -> b -> (a, b)
pair x y = (x,y)

double :: Num a => a -> a
double x = x*2

palindrome :: Eq a => [a] -> Bool
palindrome xs = reverse xs == xs

twice :: (t -> t) -> t -> t
twice f x = f (f x)