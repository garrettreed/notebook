# Closure

A closure is a persistent local variable scope. It would normally be wiped away when the function finishes executing, but due to the closure, the scope is retained. Demonstrated by returning a function

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

Problems come about when using closures in `for` loops because `var` has function scoping (`let` and const are `block` scoped)

```js
var queue = [];

for (var i = 0; i < 5; i++) {
    function logIt() {
        return function() {
            console.log("running", i);
        };
    }
    queue.push(logIt());
}
og; // running 5
// running 5
```

when reassigning the variable, the closure closes over the appropariate variable

```js
var queue = [];

for (var i = 0; i < 5; i++) {
    function logIt() {
        var b = i;
        return function() {
            console.log("running", b);
        };
    }
    queue.push(logIt());
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

interestingly, chging the broken example for loop to use `i` as the counter variable name makes it work again.

```js
for (var i = 0; i < queue.length; i++) {
    queue[i]();
}
```
