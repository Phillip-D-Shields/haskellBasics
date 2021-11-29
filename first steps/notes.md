# glasgow haskell compiler

- ghc is most common implementation of Haskell, with compiler and interpreter
- interactive interpreter is well suited for teaching and prototyping
- freely available

##### compiler translates to low level language, intrepreter runs code directly

# ghci

- starts the ghc interpreter 

# standard library

haskell comes with many standard library functions. in addition to common num functions (+, *, -, ...), the library contains many useful list functions

> select the first element

```> head [1,2,3,4,5]```

> remove the first element

```> tail [1,2,3,4,5]```

> select nth element

```> [1,2,3,4,5] !! 2```

> select the first n elements

```> take 3 [1,2,3,4,5]```

> remove first n elements

```> drop 3 [1,2,3,4,5]```

> calculate the length of a list

```> length [1,2,3,4,5]```

> calculate the sum of a list (of numbers)

```> sum [1,2,3,4,5]```

> calculate the product of a list

```> product [1,2,3,4,5]```

> append two lists

```> [1,2,3] ++ [4,5]```

> reverse a list

```> reverse [1,2,3,4,5]```

# function application

in maths, function application is written using parantheses, and multiplication is shown by juxtaposition or by using a space

> apply function 'f' to 'a' and 'b', then add the result to the product of 'c' and 'd' 
```f(a,b) + c d```

in haskell, function application is written using a space, and multiplication is written with '*'

> same as maths example above, but written in haskell

``` f a b + c*d```

### function application in haskell has higher priority than other operators

``` f a + b```
> means (f a) + b, not f (a + b)

| maths | haskell |
|---|---|
| f(x) | f x  |
| f(x,y)  | f x y  |
| f(g(x))  | f (g x)  |
| f(x,g(y))  | f x (g y)  |
| f(x)g(y)  | f x * g y  |

# haskell scripts

- new functions are defined within a script
- haskell scripts usually have ```.hs``` suffix on filename, not mandatory but usefull for identification

# first script

see ```test.hs```

- create ```test.hs``` 
- add code
- run ```ghci test.hs``` in terminal
- ```:quit``` will exit interpreter
- ```:reload``` will reload file

# useful ghci commands

> 'n' denotes a specific name, not a number

| command  | meaning  |
|---|---|
| :load n  | load script n  |
| :reload  | reload current script  |
| :set editor n  | set editor to n  |
| :edit n  | edit script n  |
| :edit  | edit current script  |
| :type X | show type of X  |
| :? | show all commands |
| :quit | quit ghci |

# naming requirements

- function and arg names MUST begin with lowercase letters
- list args usually have an 's' suffix, such as```xs, ns, nss```

# layout rule

- in a sequence of definitions, each must begin in the same column
- allows for implicit grouping, similar to python (indents show implicit grouping)

