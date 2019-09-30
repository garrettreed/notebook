# try, catch, finally

-   Catch block is used whenever an exception is thrown (not when returning an Error).
-   You can nest `try` statements. If an inner `try` doesn't have a corresponding `catch`, it will bubble up. You'll need to throw the exception again within a nested `catch` if you want it to bubble up.
-   Realized this was a thing when I was trying to figure out an equivalent to `Promise.prototype.finally` in `async`/`await`.
-   If a `finally` block does not include a return statement, it has no effect on the return value. If `finally` does return a value, it overrides the `try`/`catch` return, including nested blocks.
-   `finally` can be used without a `catch`, but one of the two _must_ be present for a `try`.
-   Conditional catches are non-standard, so don't use them. Was good for type checking the exception. Syntax was like `} catch (e if e instanceof EvalError) {` and allowed multiple.
