# Monads in JS

JS is not purely functional because it has mutable data and states.
In a language like Haskell, state is managed using monads.
More of an academic exercise in this instance.

## Implementation

```js
/* Code by Douglas Crockford */
function MONAD(modifier) {
    "use strict";
    var prototype = Object.create(null);
    prototype.is_monad = true;
    function unit(value) {
        var monad = Object.create(prototype);
        monad.bind = function(func, args) {
            return func.apply(undefined, [value].concat(Array.prototype.slice.apply(args || [])));
        };
        if (typeof modifier === "function") {
            modifier(monad, value);
        }
        return monad;
    }
    unit.method = function(name, func) {
        prototype[name] = func;
        return unit;
    };
    unit.lift_value = function(name, func) {
        prototype[name] = function() {
            return this.bind(func, arguments);
        };
        return unit;
    };
    unit.lift = function(name, func) {
        prototype[name] = function() {
            var result = this.bind(func, arguments);
            return result && result.is_monad === true ? result : unit(result);
        };
        return unit;
    };
    return unit;
}
```

## Application

```js
var monad = MONAD();
monad(prompt("Enter your name:")).bind(function(name) {
    alert("Hello " + name + "!");
});
```
