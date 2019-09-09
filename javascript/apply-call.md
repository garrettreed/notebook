# `apply` and `call`

-   Borrow functions and set `this` in function invocation

## Syntax

```js
fun.apply(thisArg, [argsArray]);
fun.call(thisArg, arg1, arg2, ...);
```

## Simple Example

```js
var avgScore = "global avgScore";

function avg(scoreArr) {
    var scoreSum = scoreArr.reduce(function(prev, cur) {
        return prev + cur;
    });
    this.avgScore = scoreSum / scoreArr.length;
}
var gameController = {
    scores: [20, 34, 55, 77],
    avgScore: null
};

avg(gameController.scores); // Sets avgScore on window
avg.call(gameController, gameController.scores); // Sets in gameController
```

## Set `this` in Callback Functions

```js
var clientData = {
    id: 094545,
    fullName: "Not Set",
    setUserName: function(first, last) {
        this.fullName = first + " " + last;
    }
};

function getUserInput(first, last, callback, callbackObj) {
    callback.apply(callbackObj, [first, last]);
}

getUserInput("Barack", "Obama", clientData.setUserName, clientData);
```

## Borrowing Functions

The most common use case, especially dealing with `arguments`, as it is an array-like object

```js
var anArrayLikeObj = { 0: "Martin", 1: 78, 2: 67, 3: ["Letta", "Marieta", "Pauline"], length: 4 };
var newArray = Array.prototype.slice.call(anArrayLikeObj, 0);
// newArray === ["Martin", 78, 67, Array[3]]
var searchIt = Array.prototype.indexOf.call(anArrayLikeObj, "Martin");
// searchIt === true
var revIt = Array.prototype.reverse.call(anArrayLikeObj);
// revIt ===  {0: Array[3], 1: 67, 2: 78, 3: "Martin", length: 4}​
Array.prototype.pop.call(anArrayLikeObj);
// anArrayLikeObj ===  {0: Array[3], 1: 67, 2: 78, length: 3}​
Array.prototype.push.call(anArrayLikeObj, "Jackie");
// anArrayLikeObj === {0: Array[3], 1: 67, 2: 78, 3: "Jackie", length: 4}​
```

There's countless use-cases when dealing with variable arity.
[See Richard Bovell's awesome post on these topics for more examples and clarity](http://javascriptissexy.com/javascript-apply-call-and-bind-methods-are-essential-for-javascript-professionals/)
