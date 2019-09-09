# Learn You a Haskell Introduction

## REPL notes

-   use `let` to declare stuff, e.g. `let double x = x + x`
-   With a program `prog.hs`, type `:l prog` to use its Functions
-   `:t something` to get type
-   Declare function type on one line: `let factorial :: Integer -> Integer; factorial n = product [1..n]`

## Some Math Functions

-   `succ 1 -- 2`
-   `min 9 10 -- 9`
-   `` 9 `min` 10 -- uses infix form ``
-   `max 9 10 -- 10`

## Some List Operators

-   `[1,2,3,4] ++ [9,10,11,12] -- concat lists`
-   `'A':" B C D"`
-   `5:[4,3,2,1]`
-   `"List" !! 2 -- s`
-   Lists are homogeneous

## Some List Functions

-   `head [1,2,3,4] -- 1`
-   `tail [1,2,3,4] -- [2,3,4]`
-   `last [1,2,3,4] -- 4`
-   `init [1,2,3,4] -- [1,2,3]`
-   `length [1,2,3,4] -- 4`
-   `null [1,2,3] -- False`
-   `null [] -- True`
-   `reverse [1,2,3,4] -- [4,3,2,1]`
-   `take 3 [1,2,3,4,5] -- [1,2,3]`
-   `drop 3 [1,2,3,4,5] -- [4,5]`
-   `minimum [1,2,3,4] -- 1`
-   `maximum [1,2,3,4] -- 4`
-   `sum [1,2,3,4] -- 10`
-   `product [1,2,3,4] -- 24`
-   `` 4 `elem` [3,4,5,6] -- True ``

## Comprehensions

-   `[x*2 | x <- [1..10], x < 10]`
    -   `x*2`: output function
    -   `x <- [1..10]`: input set
    -   `x < 10`: predicate
    -   `[2,4,6,8,10,12,14,16,18]`: result
-   `[x*2 | x <- [1..10], x*2 >= 12] -- [12,14,16,18,20]`
-   `[ x | x <- [50..100], x`mod`7 == 3] -- [52,59,66,73,80,87,94]`
-   `[ if x < 10 then "BOOM!" else "BANG!" | x <- [7..13], odd x] -- ["BOOM!","BOOM!","BANG!","BANG!"]`
-   Multiple predicates: `[ x | x <- [10..20], x /= 13, x /= 15, x /= 19] -- [10,11,12,14,16,17,18,20]`
-   Multiple lists: `[ x*y | x <- [2,5,10], y <- [8,10,11]] -- [16,20,22,40,50,55,80,100,110]`
-   Look up nested comprehensions for further complexity

### Tuples

-   About
    -   Heterogeneous
    -   Type is determined by number and types of components
    -   No such thing as a singleton tuple `(1)`
    -   Cannot append to a tuple
    -   Cannot compare tuples of different sizes
-   `[(1,2),(8,11),(4,5)] -- ok`
-   `[(1,2),(8,11,5),(4,5)] -- error`
-   `[(1,2),("One",2)] -- error`
-   `[("Red", 1), ("Blue", 2)] -- ok`

### Some Tuple Functions

-   `fst` takes a pair and returns first component
    -   `fst (8,11) -- 8`
-   `snd` takes a pair and returns second component
    -   `snd (8,11) -- 11`
-   `zip` combines two lists into a list of pairs
    -   `zip [1..5] [5,4..1] -- [(1,5),(2,4),(3,3),(4,2),(5,1)]`
    -   `zip [5,3,2,6,2,7,2,5,4,6,6] ["im","a","turtle"] -- [(5,"im"),(3,"a"),(2,"turtle")]`
        -   Longer list is cut off to match
    -   `zip [1..]['a','b','c'] -- [(1,'a'),(2,'b'),(3,'c')]`
        -   Haskell is lazy. Infinite lists may be zipped.

### Tuple example problem

-   All triangles with sides <= 10
    -   `let triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ]`
-   All right triangles with sides <= 10
    -   `let rightTriangles = [(a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]`
-   All right triangles with sides <= 10 and perimeter == 24
    -   `let rightTriangles' = [(a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]`
    -   Answer: `[(6,8,10)]`
