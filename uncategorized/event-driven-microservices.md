# REST vs Messaging (Event-Driven) Microservices

REST works best:

-   Synchronous Request/Response
-   Publicly facing APIs

Messaging works best in most other situations due to these benefits:

-   Loosely coupled
-   Non-blocking

## Events vs Messages

> The difference being that messages are directed, events are not — a message has a clear addressable recipient while an event just happen for others (0-N) to observe it.

But this is not universally true.
