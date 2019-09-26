# Go Maps

```go
package main

import "fmt"

func main() {
    m := make(map[string]int)       //make(map[key-type]val-type)

    m["k1"] = 7
    m["k2"] = 13

    fmt.Println("map:", m)

    v1 := m["k1"]
    fmt.Println("v1:",v1)

    fmt.Println("len:", len(m))

    delete(m, "k2")
    fmt.Println("map:",m)

    _, prs := m["k2"]               // value of key (blank here), if exists or not
    fmt.Println("prs:",prs)

    a, b := m["k1"]
    fmt.Println(a,b)

    n := map[string]int{"foo": 1, "bar": 2}
    fmt.Println("map:",n)
}
```
