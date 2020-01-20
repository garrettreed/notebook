# JavaScript Errors

## Throwing Things

You can `throw` anything. These are all valid

-   `throw new Error("something went wrong");`
-   `throw "oh no"`
-   `throw {name: "bob"}`

Browser's don't really support it though. They call `String()` on the thrown value. Some will return the message `uncaught exception` and include the message. Others will not include it. Most browsers also attach other contextual information when using the `Error`, so just throw that.

## Error Types

-   `Error` – base type for all errors. Never actually thrown by the engine.
-   `EvalError` – thrown when an error occurs during execution of code via eval()
-   `RangeError` – thrown when a number is outside the bounds of its range. For example, trying to create an array with -20 items (new Array(-20)). These occur rarely during normal execution.
-   `ReferenceError` – thrown when an object is expected but not available, for instance, trying to call a method on a null reference.
-   `SyntaxError` – thrown when the code passed into eval() has a syntax error.
-   `TypeError` – thrown when a variable is of an unexpected type. For example, new 10 or "prop" in true.
-   `URIError` – thrown when an incorrectly formatted URI string is passed into encodeURI, encodeURIComponent, decodeURI, or decodeURIComponent.

## Extend `Error`

```js
function CustomError(message, fileName, lineNumber) {
    var instance = new Error(message, fileName, lineNumber);
    instance.name = "CustomError";
    Object.setPrototypeOf(instance, Object.getPrototypeOf(this));
    if (Error.captureStackTrace) {
        Error.captureStackTrace(instance, CustomError);
    }
    return instance;
}

CustomError.prototype = Object.create(Error.prototype, {
    constructor: {
        value: Error,
        enumerable: false,
        writable: true,
        configurable: true
    }
});

if (Object.setPrototypeOf) {
    Object.setPrototypeOf(CustomError, Error);
} else {
    CustomError.__proto__ = Error;
}

try {
    throw new CustomError("bazMessage");
} catch (e) {
    console.log(e.name); //CustomError
    console.log(e.message); //bazMessage
    console.log(e.stack); // CustomError: bazMessage...
}
```
