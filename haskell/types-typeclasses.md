# Types and Typeclasses

[Learn You a Haskell Types and Typeclasses](http://learnyouahaskell.com/types-and-typeclasses)

## Types

-   `[Char]` is synonymous with `String`
-   `removeNonUppercase :: String -> String`
-   Multi-param function:

```haskell
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z
```

-   Some common types:
    -   `Int`: bounded integer with max of 2147483647 and min of -2147483648
    -   `Integer`: not bounded
    -   `Float`: real floating point with single precision
    -   `Double`: rfp with double precision
    -   `Bool`
    -   `Char`

### Record Syntax

```haskell
data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     , height :: Float
                     , phoneNumber :: String
                     } deriving (Show)
```

`:t age -- age :: Person -> String`

### Type Parameters

-   **Type Constructors** take types as parameters to produce new types.
-   `data Maybe a = Nothing | Just a`
    -   `a` is the type paramter
    -   `Maybe` is the type constructorp

### Type Variables

-   Like generics in other languages but more powerfçul
-   Can be used to write polymorphic functions when no specific behavior of a type is used

## Typeclasses

```
--------- Function Type ---------
:t (==)
(==) :: (Eq a) => a -> a -> Bool
 1        2       3    4     5
1: The function
2: Class Constraint
3: First input value
4: Second input value
5: Output value

"The equality function takes any two values
that are of the same type and returns a Bool.
The type of those two values must be a member
of the Eq class"
```

-   A typeclass is an interface that defines some behavior
-   If a type is part of a typeclass, it supports the behavior the typeclass describes
-   All standard Haskell types except for IO and functions are a part of `Eq`
-   Example Typeclasses:
    -   `Eq`: types that support equality testing: `==`, `/=`
    -   `Ord`: types that have an ordering: `>`, `<`, `>=`
        -   An `Ordering` is a type that can be `LT`, `GT`, `EQ`
    -   `Show`: types that can be presented as strings: `show`
    -   `Read`: takes a string and returns a type: `read`
        -   `read "True" || False -- True`
        -   `read "5" :: Int -- 5`
        -   `read "(3, 'a')" :: (Double, Char) -- (3.0,'a')`
    -   `Enum`: sequentially ordered types: `()`, `Bool`, `Char`, `Ordering`, `Int`, `Integer`, `Float`, `Double`
    -   `Bounded`: have an upper and lower bound
        -   `minBound :: Int -- -2147483648`
    -   `Num`: All numbers
    -   `Integral`: Only whole numbers
        -   `fromIntegral :: (Num b, Integral a) => a -> b`
        -   `fromIntegral (3 :: Int) + 3.2`
    -   `Floating`: Only floating point
