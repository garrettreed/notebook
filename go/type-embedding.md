# Type Embedding

```go
type Ball struct {
    Radius   int
    Material string
}

func (b Ball) Bounce() {
    fmt.Printf("Bouncing ball %+v\n", b)
}

type Football struct {
    Ball
}

fb := Football{Ball{Radius: 5, Material: "leather"}}

// now you can access the method through the embedding type:
fb.Bounce()
// Bouncing ball {Radius:5 Material:leather}

// If you want to, you can call through the embedded type
fb.Ball.Bounce()
```

If an embedded type implements an interface, then that too is accessible through the embedding type

```go
type Bouncer interface {
    Bounce()
}
func BounceIt(b Bouncer) {
    b.Bounce()
}

BounceIt(fb)
```

It's also possible to embed by reference

```go
type Football struct {
    *Ball
}
```

If we instantiate an empty foodball and then call `BounceIt(fb)`, it'll throw a panic because `Bounce` is defined on a value type

## Embedding interfaces

You can use this to explicitly state that the embedding struct needs to satisfy the embedded interface, and at the same time hide its data.

```go
// Ball and (ball)Bounce() are defined as before
type Football struct {
    Bouncer
}
fb := Football{&Ball{Radius: 5, Material: "leather"}}
fb.Bounce()

```

## Notes

-   Embedded struct (child) has no access to the embedding struct (parent).
