# Pointers

## Cheatsheet

Allowed:

-   `p := Person{"Steve", 28}` stores the value
-   `p := &Person{"Steve", 28}` stores the pointer address
-   `PrintPerson(p)` passes either the value or pointer address
-   `PrintPerson(*p)` passes the value
-   `PrintPerson(&p)` passes the pointer address
-   `func PrintPerson(p Person)` ONLY receives the value
-   `func PrintPerson(p *Person)` ONLY receives the pointer address (reference)

Not Allowed:

-   `p := *Person{"Steve", 28}` illegal
-   `func PrintPerson(p &Person)` illegal

## Method Receivers

If a method needs to modify the receiver, you need to use a pointer.

```go
type MyStruct struct {
    Val int
}

// Returns a copy of the struct
func myfunc() MyStruct {
    return MyStruct{Val: 1}
}

// Returns a pointer to the struct value
func myfunc() *MyStruct {
    return &MyStruct{}
}

// Takes a pointer to the struct value as an arg,
// but can access and modify properties directly without explicit dererference.
func myfunc(s *MyStruct) {
    s.Val = 1
    // (*s).Val
}
```
