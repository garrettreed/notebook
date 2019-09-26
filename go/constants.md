# Go Constants

```go
package main

import "fmt"
import "math"

const s string = "constant"     // const declares constant

func main() {
    fmt.Println(s)

    const n = 5000000           // can appear anywhere a variable can

    const d = 3e20 / n          // perform arithmetic with arbitrary precision
    fmt.Println(d)

    fmt.Println(int64(d))       // numeric consts have no type until given one

    fmt.Println(math.Sin(n))    // can be given a type by using it in context that requires one
                                // here Sin expects a float64
}
```
