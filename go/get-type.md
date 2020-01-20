# Get a variable's type

```go
package main

import (
    "fmt"
    "reflect"
)

func main() {
    someInt := 42
    fmt.Println(reflect.TypeOf(someInt).String())
}
```
