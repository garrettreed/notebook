# Publish/Subscribe vs Observer Pattern

It's all about awareness.

Observer pattern: an object, called the subject, maintains a list of its dependents, called observers, and notifies them automatically of any state changes, usually by calling one of their methods.

Pub-sub pattern: senders of messages, called publishers, do not program the messages to be sent directly to specific receivers, called subscribers. Publishers and subscribers don't know about the existance of one another. There is a third component, a broker or message broker or event bus, which is known by both. It filters incoming messages and distributes them accordingly. Used to communicate messages between different components. Message filtering can be done in different ways, most popular being Topic-based and Content-based.

![Pub-Sub vs Observer diagram](/assets/pubsub-vs-observer.jpeg)
