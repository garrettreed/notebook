# `bind`

Set which specific object will be bound to `this` when a function is invoked

## Syntax

`fun.bind(newThis, arg1, arg2...)`

## Typical Use

Using `this` in a method and call that method from a receiver object.

```js
// This data variable is a global variable
var data = [{ name: "Samantha", age: 12 }, { name: "Alexis", age: 14 }];
var user = {
    // local data variable
    data: [{ name: "T. Woods", age: 37 }, { name: "P. Mickelson", age: 43 }],
    showData: function(event) {
        var randomNum = ((Math.random() * 2) | 0) + 1 - 1; // random number between 0 and 1
        console.log(this.data[randomNum].name + " " + this.data[randomNum].age);
    }
};
// Assign the showData method of the user object to a variable
// Pulls from global data var:
//      var showDataVar = user.showData;
// Corrected:
var showDataVar = user.showData.bind(user);

showDataVar(); // Samantha 12 (from the global data array, not from the local data array)
```

## Arguments

Any arguments passed using `bind` will be placed before the arguments the resulting function is called with.

```js
function sayColors(a, b, c) {
    console.log(a, b, c);
}
sayColors.bind(null, "blue")("red"); // blue red undefined
sayColors.bind(null, "blue").bind(null, "red")("green");
```

## Currying (or Partial Function Application)

A function that returns a new function with some of the arguments already set.

```js
function greet(gender, age, name) {
    // if a male, use Mr., else use Ms.
    var salutation = gender === "male" ? "Mr. " : "Ms. ";

    return age > 25 ? "Hello, " + salutation + name + "." : "Hey, " + name + ".";
}
var greetAnAdultMale = greet.bind(null, "male", 45);
greetAnAdultMale("John Hartlove"); // 'Hello, Mr. John Hartlove.'

var greetAYoungster = greet.bind(null, "", 16);
greetAYoungster("Alex"); // 'Hey, Alex.'
greetAYoungster("Emma Waterloo"); // 'Hey, Emma Waterloo.'
```

## Definition

Very similar to curry

```js
Function.prototype.bind = function() {
    var fn = this,
        args = Array.prototype.slice.call(arguments);
    var object = args.shift();
    return function() {
        return fn.apply(object, args.concat(Array.prototype.slice.call(arguments)));
    };
};
```
