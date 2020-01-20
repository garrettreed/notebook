# Go Number Types

-   Integer types: `uint8`, `uint16`, `uint32`, `uint64`, `int8`, `int16`, `int32` and `int64`.
-   uint == unsigned, int == signed
-   byte == uint8
-   rune == int32
-   3 machine dependent integer types: `uint`, `int` and `uintptr`
    -   `uint` and `int` are guaranteed to be 32 bites or larger
        `uintptr` is guranteed to be large enough to hold the bit pattern of any pointer
-   Floating Point types: `float32` and `float64`
-   Complex types: `complex64` and `complex128`
