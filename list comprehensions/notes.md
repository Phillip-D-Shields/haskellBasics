# set comprehensions

in maths, comprehension notation can be used to construct new sets from old sets

```{x^2 | x E {1...5}} => {1,4,9,16,25}```

# list comprehensions

in haskell, similar comprehension syntax is used to construct new lists from old lists

```[x^2 | x <- [1..5]] => [1,4,9,16,25]``` 

the express ```x <- [1..5]``` is called a generator, and states how to generate values for x. in this case by creating a range of 1 to 5

comprehensions can have multiple generators, separated by commas

```haskell
> [(x,y) | x <- [1,2,3], y <- [4,5]]
[(1,4), (1,5), (2,4), (2,5), (3,4), (3,5)]
```

changing the order of generators affects the order of the final list

```haskell
> [(x,y) |  y <- [4,5], x <- [1,2,3]]
[(1,4), (2,4), (3,4), (1,5), (2,5), (3,5)]
```

multiple generators are similar to nested loops, the later generators are more deeply nested

later generators can depend on variables that are introduced by earlier generators

```haskell
> [(x,y) | x <- [1..3], y <- [x..3]]
[(1,1),(1,2),(1,3),(2,2),(2,3),(3,3)]
```

using a dependant generator we can define the library function that concatenates a list of lists

```haskell
concat :: [[a]] -> [a]
concat xss = [x | xs <- xss, x <- xs]
```

an example

```haskell
> concat [[1,2,3],[4,5],[6]]

[1,2,3,4,5,6]
```

# guards

list comprehensions can use guards to restrict values of earlier generators

```[x | x <- [1..10], even x]``` 

example of a function that uses a guard to maps a positive int to a list of its factors

```haskell
factors :: Int -> [Int]
factors n =
    [x | x <- [1..n], n `mod` x == 0]
```

an example

```haskell
> factors 15
[1,3,5,15]
```

a function that shows if a number is prime, using the ```factors``` function defined above

```haskell
prime :: Int -> Bool
prime n = factors n == [1,n]
```

an example

```haskell
> prime 15
False

> prime 7
True
```

a function that returns a list of primes up to `n` using a guard with the above `prime` function

```haskell
primes :: Int -> [Int]
primes n = [x | x <- [2..n], prime x]
``` 

an example

```haskell
> primes 40
[2,3,5,7,11,13,17,19,23,29,31,37]
```

# zip function

the zip function maps two lists to a list of pairs

```haskell
zip :: [a] -> [b] -> [(a,b)]
```

an example
```haskell
> zip ['a','b','c'] [1,2,3,4] 
[('a',1),('b',2),('c',3)]
```
a function that uses zip to return a list of all pairs of adjacent elements

```haskell 
pairs :: [a] -> [(a,a)]
pairs xs = zip xs (tail xs)
```

an example 
```haskell
> pairs [1,2,3,4]
[(1,2),(2,3),(3,4)]
```
a function that uses `pairs` to decide if the elements within are sorted

```haskell
sorted :: Ord a => [a] -> Bool
sorted xs = and [x <= y | (x,y) <- pairs xs]
```
*the use of `and` returns True only if its list of Booleans are all true

an example
```haskell
> sorted [1,2,3,4]
True

> sorted [1,3,2,4]
False
```

using zip to define a function that returns a list of all positions of a value in the list

```haskell
positions :: Eq a => a [a] -> [Int]
positions x xs = [i | (x', i) <- zip xs [0..], x == x']
```

an example
```haskell
> positions 0 [1,0,0,1,0,1,1,0]
[1,2,4,7]
```

# string comprehensions

a string is represented internally as a list of characters

`"abc" => ['a','b','c']`

because strings are lists, any polymorphic function that operates on lists can be applied to strings

```haskell
> length "abcde"
5

> take 3 "abcde"
"abc"

> zip "abc" [1,2,3,4]
[('a',1),('b',2),('c',3)]
```

list comprehensions can also be used on strings. the following is an example that counts how many times a character occurs within a string

```haskell
count :: Char -> String -> Int
count x xs = length [x' | x' <- xs, x == x']

> count 's' "mississippi"
4

```