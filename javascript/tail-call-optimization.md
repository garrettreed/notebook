Tail Call: A subroutine call performed as the final procedure.

Avoid allocating a new stack from for a function because the calling function will simply return the value it gets from the called function.

Requires that the last line of the function return only a function call.

Coming to JS with ES6 in strict mode only (but es6 modules are automatically strict)

```js
// Not able to tail-call optimize because when
// the recursive call is made, the function needs
// to keep track of the multiplication it needs to
// do after the call returns.
function fact(x) {
    if (x === 0) {
        return 1;
    }
    return x * fact(x - 1); // Not a tail call
}

// Stack:
fact(3);
3 * fact(2);
3 * 2 * fact(1);
3 * 2 * 1 * fact(0);
3 * 2 * (1 * 1);
3 * (2 * 1)(3 * 2);
6;

// Able to tail-call optimize
function fact(x) {
    function factTail(x, accum) {
        if (x === 0) {
            return accum;
        }
        return factTail(x - 1, x * accum);
    }
}

fact(3);
// Optimized Stack:
//  factTail(3, 1)
//  factTail(2, 3)
//  factTail(1 6)
//  factTail(0 6)
//  6
```

## Sources

http://2ality.com/2015/06/tail-call-optimization.html
