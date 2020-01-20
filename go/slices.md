# Go Slices

```go
package main

import "fmt"

/**
 * Slices are a key data type for sequences
 */

func main() {
    s := make([]string, 3)                  // like array, but leave out count in brackets
    fmt.Println("emp:", s)                  // func make([]T, len, cap) []T     cap defaults to len
    fmt.Println("emp-len:", len(s))         // slice length
    fmt.Println("emp-cap:", cap(s))         // slice capactiy

    s[0] = "a"
    s[1] = "b"
    s[2] = "c"
    fmt.Println("set:", s)
    fmt.Println("get:", s[2])

    fmt.Println("len:", len(s))

    s = append(s, "d")                      // extended array functionality
    s = append(s, "e", "f")
    fmt.Println("apd:", s)

    c := make([]string, len(s))             // slices can be copied
    copy(c, s)
    fmt.Println("cpy:", c)

    l := s[2:5]                             // slice operator, syntax slice[low:high]
    fmt.Println("sl1:", l)

    l = s[:5]                               // slice up to, excluding s[5]
    fmt.Println("sl2", l)

    l = s[2:]                               // slices up from, including s[2]
    fmt.Println("sl3", l)

    t := []string{"g", "h", "i"}            // slice literal
    fmt.Println("dcl:",t)

    twoD := make([][]int, 3)                // multi-dimensional slices can have varying inner slice lengths
    for i := 0; i < 3; i++ {
        innerLen := i + 1
        twoD[i] = make([]int, innerLen)
        for j := 0; j < innerLen; j++ {
            twoD[i][j] = i + j
        }
    }
    fmt.Println("2d", twoD)

    // Slices reference their underlying array
    // Changing elements of a slice modifies those elements.
    // Slices that share the same underlying array will share changes.
    names := [4]string{
		"John",
		"Paul",
		"George",
		"Ringo",
	}
	fmt.Println(names)

	a := names[0:2]
	b := names[1:3]
	fmt.Println(a, b)

	b[0] = "XXX"
	fmt.Println(a, b)
	fmt.Println(names)
}
```
