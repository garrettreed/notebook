# Go Channel Buffering

```go
package main

import "fmt"

/**
 * Channel Buffering
 * Channels are unbuffered by default and will only accept sends if there is a receive ready
 * Buffered channels accept a given number of values without a receiver
 */
func main() {
    messages := make(chan string, 2)    // buffer size of 2

    messages <- "buffered"              // send values into channel without concurrent receive
    messages <- "channel"

    fmt.Println(<-messages)             // receive the values as usual
    fmt.Println(<-messages)
}
```
