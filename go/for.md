# Go For

```go
package main

import "fmt"

func main() {
    i := 1
    for i <= 3 {                // single condition
        fmt.Println(i)
        i++
    }

    for j := 7; j <= 9; j++ {   // init / condition / update
        fmt.Println(j)
    }

    for {
        fmt.Println("loop")     // repeats until beak or return from enclosing function
        break
    }
}
```
