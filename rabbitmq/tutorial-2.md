# Work Queues

-   RabbitMQ distrubtes messages in a round-robin style. Create multiple workers and publish some messages to see this in action.

`new_task.js` (producer):

```js
var amqp = require("amqplib/callback_api");

// Producer
amqp.connect("amqp://localhost", function(error0, connection) {
    if (error0) {
        throw error0;
    }
    connection.createChannel(function(error1, channel) {
        if (error1) {
            throw error1;
        }
        var queue = "task_queue";
        var msg = process.argv.slice(2).join(" ") || "Hello World!";

        channel.assertQueue(queue, {
            durable: true
        });
        channel.sendToQueue(queue, Buffer.from(msg), {
            persistent: true
        });
        console.log(" [x] Sent '%s'", msg);
    });
    setTimeout(function() {
        connection.close();
        process.exit(0);
    }, 500);
});
```

`worker.js` (consumer):

```js
var amqp = require("amqplib/callback_api");

amqp.connect("amqp://localhost", function(error, connection) {
    connection.createChannel(function(error, channel) {
        var queue = "task_queue";

        channel.assertQueue(queue, {
            durable: true
        });
        channel.prefetch(1);
        console.log(" [*] Waiting for messages in %s. To exit press CTRL+C", queue);
        channel.consume(
            queue,
            function(msg) {
                var secs = msg.content.toString().split(".").length - 1;

                console.log(" [x] Received %s", msg.content.toString());
                setTimeout(function() {
                    console.log(" [x] Done");
                    channel.ack(msg);
                }, secs * 1000);
            },
            {
                // automatic acknowledgment mode,
                // see https://www.rabbitmq.com/confirms.html for details
                noAck: false
            }
        );
    });
});
```

## Message acknowledgement

-   If `noAck` is set to `true`, once RabbitMQ delivers a message to a consumer, it immediately marks it for deletion. If a worker dies, we lose the message it was processing, as well as any others that were dispatched and not yet handled.
-   Setting it to `false` introduces message acknowledgements, which are sent by consumers back to RabbitMQ that a message has been processed. If the connection is broken without an ack, the message will be requeued.
-   There are no timeouts. It's fine if processing a message takes a long time.

## Message durability

-   Retains queues and messages in the event that the RabbitMQ server crashes/quits.
-   Queues cannot be redefined with existing parameters, so in order to add a `durable` config to the existing queue, it either needs to be deleted/recreated or just create one with a different name. The example above uses a new `task_queue` instead of `hello`.
-   The `durable` config must be applied to the producer and consumer.
-   Now that we have a durable queue, we can mark messages as persistent: `{persistent: true}`
-   There is not a formal guarantee that messages will be persistent. There is a short window of time between RabbitMQ receiving a message and saving it. For a stronger guarantee you can use [publisher confirms](https://www.rabbitmq.com/confirms.html).

## Fair Dispatch

-   Calling the `prefetch` method with a value of `1` will ensure that consumers don't have more than one message at a time. RabbitMQ will dispatch to the next worker that's not busy, or continue queueing if none are available.
-
