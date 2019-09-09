## The Symfony Command Bus

[The Command Bus](http://php-and-symfony.matthiasnoback.nl/2015/01/some-questions-about-the-command-bus/)
[Command Bus questions](http://php-and-symfony.matthiasnoback.nl/2015/01/a-wave-of-command-buses/)
[Laravel Bus](http://laravel.com/docs/5.0/bus)

### Airtype Command Bus Implementation

Laravel 4.2 doesn't have a native command bus, so we are emulating the Laravel 5 bus with some added features

-   Standardized the naming convention so that the bus may automagically call the handler via the execute() in the CommandBusInterface.
-   Constructor builds params via a `data[]` array, so fields are set implicitally via a `__get()` method.
-   The controller can be pasted-in only changing the name.
-   All logic lies within the Handler, which may explicitally call a Validator.
-   The downside to this is losing the ability to dispatch the command (call from other controller) - We can readdress this if it's absolutely needed, but I would prefer to go without it.
-   Typically called like `$this->commandBus()->handle($command);`
-   Ours looks like `$this->command_bus->execute($command)`

### Commands

Separate the technical aspects of user input from their meaning.

### Advantages of using commands

-   The command might be created anywhere by any client. As long as you hand it to command bus, it will be executed.
-   Separates logic from controller

### Disadvantages of using a command bus

-   Increases complexity with more abastration
-   Have to glue command to handler and load that info for each request

### Command as Constructor argument

-   Why does the handler not receive the actual command in the constructor?
    -   A handler itself is immutable. The constructor injects dependencies.

### How to return a value from the command bus

-   Error path for failures, nothing for success

#### Command-Query Separation(CQS) Principle

-   A function is either a:
    -   query: it returns something
    -   command: it affects state
-   Both are mutually exclusive
