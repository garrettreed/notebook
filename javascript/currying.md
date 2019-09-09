# Currying in JS

Functional transformation allowing for filling a function's arguments step-by-step.

### Implementation

```js
function curry(fn) {
    var slice = Array.prototype.slice;
    var arg_store = slice.call(arguments, 1); // array containing all but the first arg
    return function() {
        var arg_new = slice.call(arguments); // array containing all args
        var arg = arg_store.concat(arg_new);
        return fn.apply(null, arg);
    };
}
```

### Quadratic Equation Example

```js
function quad(a, b, c) {
    var d = b * b - 4 * a * c;
    var x1, x2;
    if (d < 0) throw "No roots in R";
    x1 = (-b - Math.sqrt(d)) / (2 * a);
    x2 = (-b + Math.sqrt(d)) / (2 * a);
    return {
        x1: x1,
        x2: x2
    };
}

// solve x^2 - x2 + 1
var temp = curry(quad, 1);
temp = curry(temp, -2);
temp(1);
```

### Use `bind` for Currying

```js
var f = function(a, b, c) {
    console.log(this, arguments);
};

var newF = f.bind(this, 1, 2);
newF(); // window, [1, 2]
newF = newF.bind(this, 3);
newF(); // window, [1, 2, 3];
newF(4); // window, [1, 2, 3, 4];
```
