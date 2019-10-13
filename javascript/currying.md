# Currying in JS

Functional transformation allowing for filling a function's arguments step-by-step.
A partial application may or may not have a predictable return type.
A curried function always returns another function with an arity of 1 until all of the arguments have been applied.

### Implementation

```js
function curry(fn) {
    var args = Array.prototype.slice.call(arguments, 1); // array containing all but the first arg
    return function() {
        return fn.apply(this, args.concat(Array.prototype.slice.call(arguments, 0))); // array containing all args
    };
}

function add3(a, b, c) {
    console.log(a + b + c);
}

var step1 = curry(add3, 1);
var step2 = curry(step1, 2);
var step3 = curry(step2, 3);

step3(); // 6
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
