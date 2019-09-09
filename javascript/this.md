# `this`

## Basics

1. `this` reference always refers to and holds the value of a singular object
2. in **strict** mode, `this` has a value of _undefined_ in global functions and anonymous functions not bound to an object
3. `this` used inside a function contains the value of the object that invokes the function

```js
$("button").click(function(event) {
    // $(this) will have the value of the
    // button ($("button")) object​
    console.log($(this).prop("name"));
});
```

## The Biggest 'Gotcha'

-   `this` is not assigned a value until an object invokes the function where `this` is defined
-   In `someObject.method();` the `someObject` automatically becomes the value of `this` in the `method()`. So with: `[1,2,3].slice()`, `[1,2,3]` is set as the value of `this` in `.slice()`.
    -   This is how you get values by indices from `arguments`. Since it's not actually an array, but an object with array-like properties, you can call `slice()` on it by calling something like `var args = slice.call(arguments, 1);`

## Misunderstanding

Things get tricky when borrowing a method that uses `this`.

### Fix `this` when used in a method passed as a callback

See the third point under basics:

```js
var user = {
    data: [{ name: "Garrett" }, { name: "Tterrag" }],
    clickHandler: function(event) {
        var rand = ((Math.random() * 2) | 0) + 1 - 1;
        console.log(this.data[rand].name);
    }
};
$("button").click(user.clickHandler);
// Cannot read property '0' of undefined
```

Solution using the bind method:

```js
$("button").click(user.clickHandler.bind(user));
```

### Fix `this` inside closure

Closures cannot access the outer function's `this` variable.

```js
var user = {
    thing: "words",
    data: [{ name: "Garrett" }, { name: "Tterrag" }],
    clickHandler: function() {
        this.data.forEach(function(person) {
            // 'this' in an anonymous function
            // can't access outer function's 'this'
            // It is bound to the global object
            // when strict mode is not used
        });
    }
};
```

Solution to maintain `this` by assigning value to another variable

```js
clickHandler: function() {
    var that = this;
    this.data.forEach(function(person) {
        console.log(person.name+' is a ' + that.thing);
    });
}
```

## Notes for ES2015

-   TL;DR => Do not use fat arrow functions for anything involving `this`
-   Use shorthand method syntax for object literal methods
-   Use regular `function` syntax for declaring prototype methods
-   Do not use for callbacks that should reference parent function with `this`
-   Fat arrows cannot be constructors
