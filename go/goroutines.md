# Goroutines

```go
package main

import "fmt"

/**
 * Goroutines Introduction
 * lightweight thread of execution
 */
func main() {

    // Typical synchronous call of f()
    f("direct")

    // Goroutine call of f() runs it concurrently
    go f("goroutine")

    // You can also start a goroutine for an anonymous function call.
    go func(msg string) {
        fmt.Println(msg)
        j := 0
        for i := 0; i < 2000000; i++ { j = i }
        fmt.Println("done going",j)
    }("going")

    // Our two function calls are running asynchronously in
    // separate goroutines now, so execution falls through
    // to here. This `Scanln` code requires we press a key
    // before the program exits.
    var input string
    fmt.Scanln(&input)
    fmt.Println("done")
}

func f(from string) {
    for i := 0; i < 3; i++ {
        fmt.Println(from, ":", i)
    }
}
```
