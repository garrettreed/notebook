# Go Types

```go
// Define a solo new type.
type NewTypeName SourceType

// Define multiple new types together.
type (
	NewTypeName1 SourceType1
	NewTypeName2 SourceType2
)
```

-   A new defined type and its respective source type in type definitions are two distinct types.
-   Two types defined in two type definitions are always two distinct types.
-   The new defined type and the source type will share the same underlying type (see below for what are underlying types), and their values can be converted to each other.
-   Types can be defined within function bodies.

More Examples:

```go
// The following new defined and source types
// are all basic types.
type (
	MyInt int
	Age   int
	Text  string
)

// The following new defined and source types are
// all composite types.
type IntPtr *int
type Book struct{author, title string; pages int}
type Convert func(in0 int, in1 bool)(out0 int, out1 string)
type StringArray [5]string
type StringSlice []string

func f() {
	// The names of the three defined types
	// can be only used within the function.
	type PersonAge map[string]int
	type MessageQueue chan string
	type Reader interface{Read([]byte) int}
}
```

## Type aliases

Since go 1.9, a type alias can be defined with an `=` placed between the identifier and source type. Type aliases are not distinct from their sources.

```go
type (
	Name = string
	Age  = int
)

type table = map[string]int
type Table = map[Name]Age
```
