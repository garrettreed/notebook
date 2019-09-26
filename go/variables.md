# Go Variables

```go
package main

import "fmt"

func main() {
    var a string = "initial"    // var declares 1 or more varaible
    fmt.Println(a)              // var name followed by type

    var b, c int = 1, 2         // multiple vars at once
    fmt.Println(b,c)

    var d = true                // type inference
    fmt.Println(d)

    var e int                   // vars declared without initialization are zero-valued
    var f string
    var g bool
    fmt.Println(e,f,g)

    h := "short"                // := shorthand declares and initializes
    fmt.Println(h)
}
```
