# Closure

A closure is a persistent local variable scope. A combination of a function bundled together (enclosed) with references to its surrounding state (the lexical environment). The lexical environment would normally be wiped away when the outer function finishes executing, but due to the closure, the scope is retained. Often used as a synonym for passing/returning anonymous functions, but closure is really a technique rather than a thing.

Demonstrated by returning a function:

```js
var outer = function() {
    var a = 1;
    var inner = function() {
        console.log(a);
    };
    return inner;
};

var fnc = outer();
fnc(); // 1
```

## Issues

Problems come about when using closures in `for` loops because `var` has function scoping (`let` and const are `block` scoped). In the example below, if you called the function immediately it would work as intenended because it would immediately execute with the value of `i`. Delaying the execution, including through the use of a promise or `setTimeout`/`setInterval`, will only use the last value.

```js
var queue = [];
for (var i = 0; i < 5; i++) {
    queue.push(function() {
        console.log("running", i);
    });
}
for (var j = 0; j < queue.length; j++) {
    queue[j]();
}
// running 5 (x5)
```

The IIFE and counter reassignment create a closure, and the callback has access to a unique `b` in its scope for every iteration:

```js
var queue = [];
for (var i = 0; i < 5; i++) {
    (function() {
        var b = i;
        queue.push(function() {
            console.log("running", b);
        });
    })();
}
for (var j = 0; j < queue.length; j++) {
    queue[j]();
}
// running 1
// running 2
// running 3
// running 4
// running 5
```

Interestingly, changing the broken example for loop to use `i` as the counter variable name makes it "work". This is due to hoisting with the lack of a closure. Both `var i...` declarations are hoisted at runtime, so `i` is not reinitialized. The underlying reference is the same and the values are just reassigned.

```js
var queue = [];
for (var i = 0; i < 5; i++) {
    queue.push(function() {
        console.log("running", i);
    });
}
for (var i = 0; i < queue.length; i++) {
    queue[i]();
}
```
