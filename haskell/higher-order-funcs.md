# Higher Order Functions

[Learn You a Haskell Higher Order Functions](http://learnyouahaskell.com/higher-order-functions)

## Curried Functions, Partial application

-   Haskell functions can only take 1 parameter
-   Functions that look like they take more are curried
-   Example: `max 4 5`, `5` is applied on to `max 4`
-   A space between to things is a function application
-   Space is an operator of highest precedence
-   `max :: (Ord a) => a -> a -> a` can be rewritten as `max :: (Ord a) => a -> (a -> a)`
    -   `max` takes an `a` and returns a function that takes an `a` and returns an `a`
-   If a function is called with too few parameters, it returns a partially applied function:

    ```haskell
    let m = max 3`
    m 4 -- 4
    ```

## Ordering Higher Orders

```haskell
 -- A function that takes a function and applies it twice:
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

applyTwice (+3) 10            -- 16
    +3 +3 10
applyTwice (++ "TWO ") "ONE " -- "ONETWOTWO"
    ++ "TWO" (++ "TWO " "ONE ")
applyTwice ("TWO " ++) "ONE " -- "TWOTWOONE"
applyTwice (3:) [1]           -- [3,3,1]
applyTwice (multThree 2 2) 9  -- 144
```

## zipWith

```haskell
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

zipWith' (+) [4,2,5,6] [2,6,2,3] -- [6,8,7,9]
```

## Maps and Filters

-   map takes a function and a list and applies that function to every element of that list, producing a new list

    ```haskell
    map :: (a -> b) -> [a] -> [b]
    map _ [] = []
    map f (x:xs) = f x : map f xs

    map (+3) [1,5,3,1,6] -- [4,8,6,4,9]
    ```

-   filter returns a list of elements that satisfy the supplied predicate

    ```haskell
    filter :: (a -> Bool) -> [a] -> [a]
    filter _ [] = []
    filter p (x:xs)
         | p x       = x : filter p xs
         | otherwise = filter p xs

    filter (>3) [1,5,3,2,1,6,4,3,2,1] -- [5,6,4]
    ```

-   find largest number under 100000 divisible by 3829

    ```haskell
    largestDivisible :: (Integral a) => a
    largestDivisible = head(filter p [1000000,99999..])
      where p x = mod x 3829 == 0
    ```

## Folds

```haskell
-- foldl
sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs

-- foldr
map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs
```
