# types in haskell

a type is a collection of related values

type ```Bool``` contains two related values

# type error

applying a function to one or more args of the wrong type

``` 1 + False ``` '+' requires number types

all type errors are found at compile time, making it safer and faster with less errors at run time

# type inference

every expression has a type, which can be automatically calculated at compile time. this process is know as type inference

```:type``` command calculates type of an expression without evaluation

# basic types

| type  | definition  |
|---|---|
| Bool  | logical values  |
| Char  | single characters  |
| String  | strings of characters  |
| Int  | integer numbers  |
| Float  | floating-point numbers  |
|   |   |

# list types

a sequence of elements of the same type 

```[False, True, False] :: [Bool]```

it is possible to have a list of lists 

```[['a'], ['b','c']] :: [[Char]]```

# tuple types

a tuple is a sequence of values of different types

```(False, 'a', True) :: (Bool, Char, Bool)```

a tuple can have the same types

```(False, True) :: (Bool, Bool)```

the type of components is unrestricted

```('a', (False, 'b')) :: (Char,(Bool, Char))```

```(True,[1,2,3]) :: (Bool,[Int])```

# function types

a function is a mapping from values of one type to values of another type. input type -> output type

```even :: Int -> Bool```

input and output types are unrestricted. multiple args and results are possible with lists or tuples

```add :: (Int, Int) -> Int```

```add (x,y) = x+y```

```zeroto :: Int -> [Int]```

```zeroto n = [0..n]```

# curried functions

functions with multiple args are possible by returning functions as a result.

curried functions take args one at a time

```add' :: Int -> (Int -> Int)```

```add' x y = x+y```

non curried functions use tuples and lists

```add :: (Int, Int) -> Int```

```add (x,y) = x+y```

functions with two or more arguments can be curried by returning nested functions

```mult :: Int -> (Int -> (Int -> Int))```

```mult x y z = x*y*z```

is the equivalent of ```((mult x)y)z```

curried functions are more flexible because they can be partially applied

without tupling explicity required, all haskell functions are defined in curried form

# polymorphic functions

a function containing one or more type variables

```length :: [a] -> Int``` 

*```[a]``` denotes a list of any type variables

type variables must begin with lowercase letters.

most standard prelude functions are polymorphic

```fst :: (a,b) -> a```

```head :: [a] -> a```

```take :: Int -> [a] -> [a]```

```zip :: [a] -> [b] -> [(a,b)]```

```id :: a -> a```

# overloaded functions

a polymorphic function if its type contains one or more class constraints

```(+) :: Num a => a -> a -> a```

for any numeric type 'a', '(+)' takes two values of type 'a' and returns a value of type 'a'

haskell has multiple type classes

| class  | type  |
|---|---|
| Num  | numeric types  |
| Eq  | equality types |
| Ord  | ordered types  |

examples

```(+) :: Num a => a -> a -> a```

```(==) :: Eq a => a -> a -> Bool```

```(<) :: Ord a => a -> a -> Bool```
