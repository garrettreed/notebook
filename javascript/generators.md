# Generators

## Resources:

-   [MDN Docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/function*)
-   [Great demonstration](http://tobyho.com/2013/06/16/what-are-generators/)
-   [Browser demonstration](http://chrisbuttery.com/articles/synchronous-asynchronous-javascript-with-es6-generators/)
-   [Callbacks vs Coroutines](https://medium.com/@tjholowaychuk/callbacks-vs-coroutines-174f1fe66127#.gr0j50n5m)

## Intro

-   Define an iterative algorithm by writing a single function which can maintain its own state
-   A function becomes a generator if it contains at least one `yield` and uses the `function*` syntax.

```js
function* idMaker() {
    var index = 0;
    while (true) yield index++;
}
var gen = idMaker();
console.log(gen.next().value); // 0
console.log(gen.next().value); // 1
console.log(gen.next().value); // 2
// ...
```

## `next()` and `throw()`

-   The only two available methods on an instantiated generator
-   `next()` can take an argument to modify the generator state. A value passed to `next()` will be treated as the result of the last yield expression that paused the generator.
-   `throw()` can take an error or exception argument and can be called at any step. It stops execution, so `done` becomes `true`

```js
function* fib(){
    var fn1 = 0;
    var fn2 = 1;
    var running = true;
    while (running) {
        var current = fn1;
        fn1 = fn2;
        fn2 = current + fn1;
        var reset = yield current;
        if (reset) {
            fn1 = 0;
            fn2 = 1;
        }
        if (current > 1000) {
            running = false;
        }
    }
}

var sequence = fib();

console.log(sequence.next().value);     // 0
console.log(sequence.next().value);     // 1
console.log(sequence.next().value);     // 1
console.log(sequence.next().value);     // 2
console.log(sequence.next(true).value); // 0
console.log(sequence.next().value);     // 1
console.log(sequence.throw(new Error("this is an error"));
// done
```

## Delegating

-   yield a generator from within another. Runs through the yielded generator before returning to the parent.
-   Exceptions of the deleagated generator are propagated and thrown via the outer generator's throw method.

## Example - Getting tweets in the browser

```js
// get - XHR Request
let get = function(url) {
    return function(callback) {
        let xhr = new XMLHttpRequest();
        xhr.open("GET", url);
        xhr.onreadystatechange = function() {
            let response = xhr.responseText;
            if (xhr.readyState != 4) return;
            if (xhr.status === 200) {
                callback(null, response);
            } else {
                callback(response, null);
            }
        };
        xhr.send();
    };
};

// getTweets - generator
let getTweets = function*() {
    let totalTweets = [];
    let data;

    data = yield get("https://api.myjson.com/bins/2qjdn");
    totalTweets.push(data);

    data = yield get("https://api.myjson.com/bins/3zjqz");
    totalTweets.push(data);

    data = yield get("https://api.myjson.com/bins/29e3f");
    totalTweets.push(data);

    console.log(totalTweets);
};

// runGenerator
// A function that takes a generator function and
// recusively calls next() until `done: true`.
// This is what the co library can be used for.
let runGenerator = (function(fn) {
    let next = function(err, arg) {
        if (err) return it.throw(err);

        var result = it.next(arg);
        if (result.done) return result.value;

        if (typeof result.value == "function") {
            result.value(next);
        } else {
            next(null, result.value);
        }
    };

    let it = fn();
    return next();
})(function() {
    runGenerator(getTweets);
    console.log(tweets);
    console.log("this is logged first because of async");
})();
```

## Example - Cleaning up node.js callbacks

Benefits:

-   Prettier code
-   Line independence - the code for one operation is no longer tied to those that come after it. Reordering/removal is easy.
-   DRY error handling.
-   Thrown errors within the callbacks cannot be caught withought delegating the exception, which is still error prone due to multiple callbacks.

```js
// Nested callbacks
function read(path, fn) {
    fs.readFile(path, ‘utf8', fn);
}

function write(path, str, fn) {
    fs.writeFile(path, str, fn);
}

function readAndWrite(fn) {
    read(‘Readme.md’, function(err, str){
        if (err) return fn(err);
        str = str.replace(‘Something’, ‘Else’);
        write(‘Readme.md’, str, fn);
    });
}
```

```js
// Cleaned up as a generator
function thread(fn) {
    var gen = fn();
    function next(err, res) {
        var ret = gen.next(res);
        if (ret.done) return;
        ret.value(next);
    }

    next();
}

thread(function *(){
    var a = yield read(‘Readme.md’);
    var b = yield read(‘package.json’);
    console.log(a);
    console.log(b);
});

function read(path) {
    return function(done){
        fs.readFile(path, ‘utf8', done);
    }
}

```
