# Go Channels

```go
package main

import "fmt"

/**
 * Channels Introduction
 * Channels are pipes that connect concurrent goroutines
 */
func main() {
    messages := make(chan string)           // created with make(chan val-type)

    go func() {                             // send value using channel <- value
        messages <- "ping"
    }()

    msg := <-messages                       // receive the channel
    fmt.Println(msg)
    // Sends and Receives BLOCK by default until sender and receiver are ready
}
```
