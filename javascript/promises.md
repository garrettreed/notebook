# Promises

## Basic Form

```js
remotedb.allDocs(...).then(function (resultOfAllDocs) {
    return db.put(...);
}).then(function (resultOfPut) {
    return db.get(...);
}).then(function (resultOfGet) {
    return db.put(...);
}).catch(function (err) { // always add catch
    console.log(err);
});
```

## `Promise.all()`

-   `forEach` creates race conditions. Don't use loops to do async. Use `Promise.all()`
-   Takes array of promises and returns another promise that resolves when all in array have been resolved
-   Rejected if any sub-promise is rejected

```js
db.allDocs()
    .then(function(result) {
        return Promise.all(
            result.data.map(function(row) {
                return db.remove(row.doc);
            })
        );
    })
    .then(function(arrayOfResults) {
        // All docs have been removed
    })
    .catch(function(err) {
        console.log(err);
    });
```

## Wrap non-promises

```js
new Promise(function(resolve, reject) {
    fs.readFile("myfile.txt", function(err, file) {
        if (err) {
            return reject(err);
        }
        resolve(file);
    });
}).then(/* ... */);
```

## Side Effects

### BAD

```js
somePromise()
    .then(function() {
        someOtherPromise();
    })
    .then(function() {
        // someOtherPromise() has not resolved!
    });
```

### Do only one of 3 things in a promise:

1. `return` another promise

    ```js
    getUserByName("barb")
        .then(function(user) {
            return getUserAccountById(user.id);
        })
        .then(function(userAccount) {
            // use that userAccount
        });
    ```

2. `return` a synchronous value or `undefined`

    ```js
    getUserByName("tree")
        .then(function(user) {
            if (inMemoryCache[user.id]) {
                return inMemoryCache[user.id]; // returning a synchronous value
            }
            return getUserAccountById(user.id); // returning a promise!
        })
        .then(function(userAccount) {
            /*...*/
        });
    ```

3. `throw` a synchronous error

    ```js
    getUserByName("jul")
        .then(function(user) {
            if (user.isLoggedOut()) {
                throw new Error("user logged out!"); // throwing a synchronous error
            }
            if (inMemoryCache[user.id]) {
                return inMemoryCache[user.id]; // returning a synchronous value
            }
            return getUserAccountById(user.id); // returning a promise!
        })
        .then(function(userAccount) {
            /*...*/
        })
        .catch(function(err) {
            /*...*/
        });
    ```

## Finally

-   You can always just add a `.then()` after a `.catch()`, but it won't run if the `.catch()` block also happens to throw an error. You can be safe by using `.finally()`, which will be called regardless.
-   You can also technically sprinkle `.finally()` blocks liberally throughout your promise chain. It won't affect the chain. It'll just be confusing.
-   Has no reference to the promise. Callback will not receive a value. This makes another `.then()` your only option if you need the resolved or rejected value.
-   I only ever use these to disable loading spinners, but cleaning up event listeners is also a likely use case.
-   _Is_ part of the promise spec. I initially thought this was bluebird only. I was wrong. It's official.

## Implementation

[Implementing Promises](https://www.promisejs.org/implementing/)

```js
const PENDING = 0;
const FULFILLED = 1;
const REJECTED = 2;

function Promise(fn) {
    var state = PENDING; // store state
    var value = null; // store value or error
    var handlers = []; // store success and future handlers (.then or .done)

    function fulfill(result) {
        state = FULFILLED;
        value = result;
        handlers.forEach(handle);
        handlers = null;
    }

    function reject(error) {
        state = REJECTED;
        value = error;
        handlers.forEach(handle);
        handlers = null;
    }

    function resolve(result) {
        try {
            var t = typeof result;
            if ((t === "object" || t === "function") && typeof result.then === "function") {
                doResolve(result.then.bind(result), resolve, reject);
                return;
            }
            fulfill(result);
        } catch (e) {
            reject(e);
        }
    }

    function handle(handler) {
        if (state === PENDING) {
            handlers.push(handler);
        } else {
            if (state === FULFILLED && typeof handler.onFulfilled === "function") {
                handler.onFulfilled(value);
            }
            if (state === REJECTED && typeof handler.onRejected === "function") {
                handler.onRejected(value);
            }
        }
    }

    this.done = function(onFulfilled, onRejected) {
        setTimeout(function() {
            handle({
                onFulfilled: onFulfilled,
                onRejected: onRejected
            });
        }, 0);
    };

    this.then = function(onFulfilled, onRejected) {
        var self = this;
        return new Promise(function(resolve, reject) {
            return self.done(
                function(result) {
                    if (typeof onFulfilled === "function") {
                        try {
                            return resolve(onFulfilled(result));
                        } catch (ex) {
                            return reject(ex);
                        }
                    } else {
                        return resolve(result);
                    }
                },
                function(error) {
                    if (typeof onRejected === "function") {
                        try {
                            return resolve(onRejected(error));
                        } catch (ex) {
                            return reject(ex);
                        }
                    } else {
                        return reject(error);
                    }
                }
            );
        });
    };
    doResolve(fn, resolve, reject);
}

function doResolve(fn, onFulfilled, onRejected) {
    var done = false;
    try {
        fn(
            function(value) {
                if (done) {
                    return;
                }
                done = true;
                onFulfilled(value);
            },
            function(reason) {
                if (done) {
                    return;
                }
                done = true;
                onRejected(reason);
            }
        );
    } catch (ex) {
        if (done) {
            return;
        }
        done = true;
        onRejected(ex);
    }
}
```
