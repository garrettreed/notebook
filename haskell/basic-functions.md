# Syntax in functions

[Learn You a Haskell Functions](http://learnyouahaskell.com/syntax-in-functions#pattern-matching)

## Pattern Matching

### Should always have a default catch-all value

```haskell
seven :: (Integral a) => a -> String
seven 7 = "You picked 7!"
seven x = "FAILURE"
```

### Pattern matching and recursion

```haskell
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)
```

### With tuples

```haskell
addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)
```

### With triples

```haskell
first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z
```

### With comprehensions

```haskell
let xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]
[a+b | (a,b) <- xs] -- [4,7,6,8,11,4]
```

### Implementing the `head` function:

```haskell
head' :: [a] -> a
head' [] = error "Can't call head on empty list"
head' (x:_) = x
```

### Implementing the `length` function:

```haskell
length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs
```

### Implementing the `sum` function:

```haskell
sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs
```

## Patterns

-   Patterns are a way of making sure a value conforms to some form and deconstructing it
-   prepend with `@`
-   avoids repetition

```haskell
capital :: String -> String
capital "" = "Empty string"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]
```

## Guards

-   Guards are a way of testing whether some property of a value is true or false
-   BMI Example:

```haskell
bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | weight / height ^ 2 <= 18.5 = "Underweight"
    | weight / height ^ 2 <= 25.0 = "Normal"
    | weight / height ^ 2 <= 30.0 = "Overweight"
    | otherwise                   = "Whale"
```

-   Guards are the things indicated by the pipes
-   If evals to true, this function body is used. If false it drops to the next level

## `where`

-   Guard example using `where` to avoid repetition:

```haskell
bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | bmi <= skinny = "Underweight"
    | bmi <= normal = "Normal"
    | bmi <= fat    = "Overweight"
    | otherwise     = "Whale"
    where bmi = weight / height ^ 2
          skinny = 18.5
          normal = 25.0
          fat = 30.0
```

-   The stuff defined in a `where` block is in the function's scope only
-   `where` can be used to pattern match
-   Calc BMIs as pairs:

```haskell
calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w, h) <- xs]
    where bmi weight height = weight / height ^ 2
```

## `let`

-   Similar to `where` bindings but the variables don't span across guards
-   `let <bindings> in <expression>`
-   names defined in `let` are accessible in `in`
-   Surface area example:

```haskell
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^ 2
    in  sideArea + 2 * topArea
```

-   `let` bindings are expressions. Can be embedded almost anywhere:
-   `4 * (let a = 9 in a + 1) + 2 -- 42`
-   Can introduce functions in local scope:
-   `[let square x = x * x in (square 5, square 3, square 2)] -- [(25, 9, 4)]`
-   Semicolon required to bind variables inline
-   `(let a = 100; b = 200; c = 300 in a*b*c, let foo = "Hey "; bar = "there" in foo ++ bar) -- (6000000, "Hey there")`
-   Used inside comprehensions

```haskell
calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]
```

-   Used in comprehensions with predicates

```haskell
calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0]
```
