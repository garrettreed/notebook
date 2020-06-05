# RabbitMQ Intro

-   RabbitMQ is a message broker: it accepts and forwards messages.
-   Producer: A program that sends messages.
-   Queue: Stores messages to be sent. Bound by the host memory and disk limits. Essentially a large message buffer. Many producers can send to one queue, and many consumers can receive from one queue.
-   Consumer: A program that waits to receive messages.

## Sending:

`send.js`:

```js
var amqp = require("amqplib/callback_api");

amqp.connect("amqp://localhost", function(error0, connection) {
    if (error0) {
        throw error0;
    }
    connection.createChannel(function(error1, channel) {
        if (error1) {
            throw error1;
        }

        var queue = "hello";
        var msg = "Hello World!";

        channel.assertQueue(queue, {
            durable: false
        });
        channel.sendToQueue(queue, Buffer.from(msg));

        console.log(" [x] Sent %s", msg);
    });
    setTimeout(function() {
        connection.close();
        process.exit(0);
    }, 500);
});
```

`receive.js`:

```js
var amqp = require("amqplib/callback_api");

amqp.connect("amqp://localhost", function(error0, connection) {
    if (error0) {
        throw error0;
    }
    connection.createChannel(function(error1, channel) {
        if (error1) {
            throw error1;
        }

        var queue = "hello";

        channel.assertQueue(queue, {
            durable: false
        });

        console.log(" [*] Waiting for messages in %s. To exit press CTRL+C", queue);

        channel.consume(
            queue,
            function(msg) {
                console.log(" [x] Received %s", msg.content.toString());
            },
            {
                noAck: true
            }
        );
    });
});
```

-   You can safely run the scripts in either order.
-   Messages are removed when they are received.
-   List queues: `sudo rabbitmqctl list_queues`
