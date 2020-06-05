# Type Systems

## Nominal

-   Type safety is enforced through explicit type declarations that are checked at compile time (static typing)
-   Nominal typing means types are compatible only if their declarations are the same. The language may allow for type aliasing, in which case alias types may be substituted because they remain identical.
-   Nominal subtyping requires explicit declaration that the type is a subtype of another.
-   C++, C#, Java, Objective-C, Rust

## Structural

-   An element is considered to be compatible with another if, for each feature within the second element's type, a corresponding and identical feature exists in the first element's type.
-   Languages may not require that the features must match in name.
-   In Go, you don't need to define behavior with types in mind. If you later want to have multiple objects share behavior, you can use an interface to enforce that.
-   Typescript, Go, OCaml, Scala, Elm

## Duck Typing

-   A statement calling a method `m` on an object does not rely on the declared type of the object; only that the object, of whatever type, must supply an implementation of the method called, when called, at run-time.
-   Similar to structural, but duck typing is dynamic and determines type compatibility by only the part of the type's structure that is accessed at run time. Structural is more like static duck typing, and type safety is enforced at compile time.
-   Supported by Python, Ruby, Javascript
