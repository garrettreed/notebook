# Clojure Data Structures Introduction

## Maps

Similar to Dictionaries or Hash Maps.
Can associate functions too. Nesting is allowed. Allows mixed types.

```clojure
; Create a map
{:one 1 :two 2}

; Look up element
; Returns `nil` if non-existant
(get {:a 0 :b 1} :b) ; => 1
({:a 0 :b 1} :b) ; => 1

; Look up values in nested maps
(get-in {:a 0 :b {:c "ho hum"}} [:b :c])  ; => "ho hum"
```

## Vectors

Similar to arrays in other languages

```clojure
; Create vector
[3 2 1]

; Get 0th element
(get [3 2 1] 0)` or just `([3 2 1] 0)

; Add elements to the end of a vector
(conj [1 2 3] 4 5 6) ; => [1 2 3 4 5 6]
```

## Lists

Similar to lists except:

-   Can't use `get`. Must use `nth`, but it is slower
-   Elements are added to the beginning of a list
-   Accessing a non-existant element throws error instead of returning `nil`
-   Use lists when adding items to the beginning or writing a macro. Otherwise use vector.

```clojure
'(1 "two" 3 4.0)
(nth '(:a :b :c) 2) ; => :c
(conj '(1 2 3) 4) ; => (4 1 2 3)
```

## Sets

Collections of unique values

```
; Create a set
#{"one" 2 2 3 3.0} ; => #{"one" 2 3 3.0}
(set [3 3 3 4 4]) ; => #{3 4}

; Check for memebership
(contains? #{:a :b} :a) ; => true
(contains? #{:a :b} 3) ; => false
(get #{:a :b} :a) ; => :a
(get #{:a nil} nil) ; => nil -- this is kind of weird
(get #{:a :b} :c) ; => nil
(:a #{:a :b}) ; => :a
(:c #{:a :b}) ; => nil
```
