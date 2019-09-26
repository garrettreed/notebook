# Go Arrays

```go
package main

import "fmt"

func main() {
    var a [5]int // create a length 5 array initialized wit 0s
    fmt.Println("emp:",a)

    a[4] = 100
    fmt.Println("set:",a)
    fmt.Println("get:",a[4])

    fmt.Println("len:",len(a))

    b := [5]int{1,2,3,4,5}
    fmt.Println("dcl:",b)

    c := [...]int{2,4,6,8,10} // Count array length
    fmt.Println("cnt",c)

    var twoD [2][3]int
    for i:= 0; i < len(twoD); i++ {
        for j := 0; j < len(twoD[i]); j++ {
            twoD[i][j] = i + j
        }
    }
    fmt.Println("2d:",twoD)

}
```
