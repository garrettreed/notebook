# Go range

```go
package main

import "fmt"

/**
 * Range iterates over elements
 */
func main() {

    nums := []int{2,3,4}
    sum := 0
    for _, num := range nums { // range provides index, value in slices and arrays
        sum += num
    }
    fmt.Println("sum:",sum)

    for i, num := range nums {
        if num == 3 {
            fmt.Println("index:",i)
        }
    }

    kvs := map[string]string{"a": "apple", "b": "banana"}
    for k, v := range kvs {
        fmt.Printf("%s -> %s\n", k, v)
    }

    for i, c := range "go" { // iterate of unicode strings
        fmt.Println(i, c)
    }
}
```
