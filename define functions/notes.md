# conditional expressions

```
abs :: Int -> Int
abs n = if n >= 0 then n else -n
```

abs takes int and returns n if it is non-negative and negative n otherwise

return statements are not required

conditional expressions can be nested

```
signum :: Int -> Int
signum n = if n < 0 then -1 else
                if n == 0 then 0 else 1
```

conditional expressions must always have an else branch, this avoids ambiguity in nested conditionals

# guarded equations

an alternative to conditionals. the following expression is the same as the previous ``` abs ``` function above

```
abs n   | n >= 0      = n
        | otherwise   = -n
```
guarded equations can be used to make definitions with multiple conditions easier to read

```
signum n    | n < 0     = -1
            | n == 0    = 0
            | otherwise = 1
```

the catch all condition ```otherwise``` is defined in the standard prelude as ```otherwise = True```

# pattern matching

many functions have a clear definition using pattern matching on their args

functions can be defined multiple different ways with pattern matching

``` haskell
(&&) :: Bool -> Bool -> Bool
True && True    = True
True && False   = False
False && True   = False
False && False  = False
```

the above can be defined more compactly

``` haskell
True && True    = True
_    && _       = False  // _ is a wildcard symbol
```

a more efficient definition could avoid avoid evaluating the second arg depending on the first

``` haskell
True    && b = b
False   && _ = False
```

patterns are matched in order. the following would always return False

``` haskell
_    && _    = False
True && True = True
```

patterns may not repeat variables. the following would give an error

``` haskell
b   && b    = b
_   && _    = False
```

# list patterns

internally, any non-empty list is constructed with the repeated use of the 'cons' operater that adds an element to the start of a list. the cons operator is shown below as the ' : ' symbol. cons = constructor.

```[1,2,3,4] => 1:(2:(3:(4:[])))```

functions on lists can be defined using the ```x:xs``` pattern

``` haskell
head :: [a] -> a
head (x:_) = x

tail :: [a] -> [a]
tail (_:xs) = xs
```

```x:xs``` patterns only match non-empty lists

```x:xs``` patterns must be paranthesised, because of application priority. errors will be given without paranthesis

# lambda expressions

functions can be constructed without names by use of lambda expressions

lambda expressions can be used to give a formal meaning to functions defined using currying

``` haskell
add :: Int -> Int -> Int
add x y = x + y
```

below is the same, but with the lambda expressions illustrated (lambda is expressed via a backslash ' \ ')

``` haskell
add :: Int -> (Int -> Int)
add = \x -> (\y -> x + y)
```

lambdas are useful to avoid naming functions that are only referenced once

before lambda

```haskell
odds n = map f [0..n-1]
         where
             f x = x*2 + 1
```

simplified with lambda

``` haskell
odds n = map (x -> x*2 + 1) [0..n-1]
```

# operator sections

an operator written betwen two args can be converted into a curried function by writing it before its two args using paranthesis

```1+2 => (+) 1 2```

this convention also allows on of the args of the operator to be included in the parantheses

```(1+) 2 ``` or ```(+2) 1``` achieve the same as ```(+) 1 2```

functions with this form are called sections ```(+),(x+),(+y)```

useful functions with sections:

```(1+) => successor function```

```(1/) => reciprocation function```

```(*2) => doubling function```

```(/2) => halving function```

