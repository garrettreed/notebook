# Clojure basic syntax introduction

## Control Flow

### If/Else and Do

```clojure
(if boolean-form
  then-form
  optional-else-form)

(if true
  "By Zeus's hammer!"
  "By Aquaman's trident!")
; => "By Zeus's hammer!"

(if true
  (do (println "Success!")
      "By Zeus's hammer!")
  (do (println "Failure!")
      "By Aquaman's trident!"))
```

### When

Like a combination of `if` and `do` without an `else` branch.
Is not like a `while` loop. Does not repeat.

```clojure
(when true
  (println "Success!")
  "abra cadabra")
; => Success!
; => "abra cadabra"
```

### Nil

`nil` and `false` both represent falseness. `nil` represents no value.

```clojure
(nil? 1) ; => false
(nil? nil) ; => true
(nil? false) ; => false
```

### Or/And

-   `or` returns the first truthy value or last value.
-   `and` returns the first falsey value or the last truthy value.

## Naming Values

### Def

```clojure
(def severity :mild)
(def error-code 4)
(def error-codes [1 2 3 4])
```
