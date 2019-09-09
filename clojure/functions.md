# Clojure Functions Introduction

## Calling

-   Function calls are enclosed in parentheses

## Defining

1. `defn` to define
2. FUnction name
3. Optional docstring
4. Params in brackets
5. Function Body

```clojure
(defn introduce
    "Return an introduction given a name"
    [name]
    (str "Hello, my name is " name))

(introduce "Garrett") ; => "Hello, my name is Garrett"
```

### Params and Arity

Simple params:

```clojure
(defn no-params
    []
    "I take no parameters!")
(defn two-params
    [x y]
    (str "Two parameters!" x y))
```

Overloading:

```clojure
(defn x-chop
    "Describe the kind of chop you're inflicting on someone"
    ([name chop-type]
        (str "I " chop-type " chop " name "! Take that!"))
    ([name]
        (x-chop name "karate")))
```

Variable Arity:

-   Uses rest parameter syntax `& listOfStuff`
-   Converts the arguments into a list
-   When mixing rest with normal, the rest must come last

```clojure
(defn favorite-things
    [name & things]
    (str "Hi, " name ", here are my favorite things: "
        (clojure.string/join ", " things)))

(favorite-things "Doreen" "gum" "shoes" "kara-te")
; => "Hi, Doreen, here are my favorite things: gum, shoes, kara-te"
```

Destructuring:

-   Bind names to values within a collection (list, map, set, or vector)

```clojure
; With a vector
(defn chooser
    [[first-choice second-choice & unimportant-choices]]
    (println (str "Your first choice is: " first-choice))
    (println (str "Your second choice is: " second-choice))
    (println
        (str "Ignoring the rest of your choices. "
            (clojure.string/join ", " unimportant-choices))))

(chooser ["Marmalade", "Handsome Jack", "Pigpen", "Aquaman"])
; => Your first choice is: Marmalade
; => Your second choice is: Handsome Jack
; => Ignoring the rest of your choices. Pigpen, Aquaman

; With a map
(defn announce-treasure-location
    [{:keys [lat lng]}]
    (println (str "Treasure lat: " lat))
    (println (str "Treasure lng: " lng)))

(announce-treasure-location {:lat 28.22 :lng 81.33})
; => Treasure lat: 100
; => Treasure lng: 50

; Retain access to original map with `:as`
(defn receive-treasure-location
    [{:keys [lat lng] :as treasure-location}]
    (println (str "Treasure lat: " lat))
    (println (str "Treasure lng: " lng))
    (steer-ship! treasure-location))
```

### Function Body

-   Can contain forms of any kind
-   Automatically returns last form evaluated

## Anonymous Functions

```clojure
; `fn` syntax:
(map (fn [name] (str "Hi, " name))
    ["Darth Vader" "Mr. Magoo"])
; => ("Hi, Darth Vader" "Hi, Mr. Magoo")

((fn [x] (* x 3)) 8)
; => 24

; Shorthand `#` syntax with single arg
(#(* % 3) 8) ; => 24

; With multiple args
(#(str %1 " and " %2) "cornbread" "butter beans")
```

## Closures

-   Function returned by another
-   Can access all vars in scope when function was created

```clojure
(defn inc-maker
    "Create a custom incrementor"
    [inc-by]
    #(+ % inc-by))

((inc-maker 3) 7) ; => 10

(def inc3 (inc-maker 3))
(inc3 7) ; => 10
```
