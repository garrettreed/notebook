# Web Workers

-   Offload heavy operations to background threads.
-   Don't interfere with UI/rendering
-   Every line of frontend JS you've ever written has (momentarily) stopped your page from working. Even promises/async.
-   IE10+
-   Can't directly manipulate the DOM from inside a worker. Most everything else is possible, including WebSockets and IndexDB.
-   Data is sent between workers andthe main thread via messages: `postMessage()` method and `onmessage` event handler.
-   Workers may spawn new workers as long as they are hosted within the same origin as the parent page.
-   Spawns real OS-level threads
-   Data passed between the main page and workers is copied, not shared

## Not Service Worker

Service Workers are a fancy cache for offline support

## Use of Dedicated Workers

```js
// main.js
var myWorker = new Worker("worker.js");

myWorker.onmessage = function(e) {
    result.textContent = e.data;
    console.log("Message received from worker");
};

someElement.onchange = function() {
    myWorker.postMessage([someElement.value, anotherElement.value]);
    console.log("Message posted to worker");
};

anotherElement.onchange = function() {
    myWorker.postMessage([someElement.value, anotherElement.value]);
    console.log("Message posted to worker");
};

myWorker.terminate();

// worker.js
onmessage = function(e) {
    console.log("Message received from main script");
    var workerResult = "Result: " + e.data[0] * e.data[1];
    console.log("Posting message back to main script");
    postMessage(workerResult);
};

// close(); // this would terminate the worker from itself
```

## Importing

Workers hae access to a global function `importScripts()`

```js
importScripts(); /* imports nothing */
importScripts("foo.js"); /* imports just "foo.js" */
importScripts("foo.js", "bar.js"); /* imports two scripts */
importScripts("//example.com/hello.js"); /* You can import scripts from other origins */
```

## Use of Shared Workers

TODO
