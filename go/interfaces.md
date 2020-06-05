# Using the empty interface for generics

`interface{}` is the Go empty interface, a key concept. Every type implements it by definition.

An interface is a type, so you can define for example:

```go
type Dog struct {
    Age interface{}
}
```

and you can also pass an empty interface type as a function parameter:

```go
func Eat(t interface{}) {
}
```

Can I convert a []T to an []interface{}?

```go
t := []int{1, 2, 3, 4}
s := make([]interface{}, len(t))
for i, v := range t {
    s[i] = v
}
```

You might need to determine the underlying type to act on an argument:

```go
func functionOfSomeType() interface{} {
	return false
}
func main() {
    var t interface{}
    t = functionOfSomeType()
    switch t := t.(type) {
    default:
        fmt.Printf("unexpected type %T\n", t)
    case bool:
        fmt.Printf("boolean %t\n", t)
    case int:
        fmt.Printf("integer %d\n", t)
    case *bool:
        fmt.Printf("pointer to boolean %t\n", *t)
    case *int:
        fmt.Printf("pointer to integer %d\n", *t)
    }
}
```
