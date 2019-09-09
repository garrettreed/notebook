# Case expressions

Pattern matching on parameters in function definitions is syntactic sugar for case expressions. Can be used pretty much anywhere

These are the same:

```haskell
head' :: [a] -> a
head' [] = error "Empty list"
head' (x:_) = x
```

```haskell
head' :: [a] -> a
head' xs = case xs of
    [] -> error "Empty list"
    (x:_) -> x
```

## Syntax

```haskell
case expression of
    pattern -> result
    pattern -> result
    pattern -> result
```
