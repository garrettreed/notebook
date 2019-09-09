# Node.js Streams

Following the unix core philosophy of small tools.
[Substack Reference](https://github.com/substack/stream-handbook)

## A Quick Example...

### The Problem

This code buffers the entirety of `data.txt` into memory for every single request before writing the result back.

```js
var http = require("http");
var fs = require("fs");

var server = http.createServer(function(req, res) {
    fs.readFile(__dirname + "/data.txt", function(err, data) {
        res.end(data);
    });
});
server.listen(8000);
```

### The Solution

`req` and `res` are both stream objects, so we can utilize `fs.createReadStream()` instead of `fs.readFile()`.
`.pipe()` listens for `data` and `end` events.
The file will be written to clients one chunk at a time. Node handles slow or high latency connections automatically.

```js
var http = require("http");
var fs = require("fs");

var server = http.createServer(function(req, res) {
    var stream = fs.createReadStream(__dirname + "/data.txt");
    stream.pipe(res);
});
server.listen(8000);
```

## Basics

The 5 types: readable, writable, transform, duplex, and classic

### pipe

-   All streams use `.pipe()` to pair inputs with outputs: `src.pipe(dest)`
-   Returns `dest` so you can chain pipes

### readable streams

Produce data that can be fed to writable, transform, or duplex stream

```js
var Readable = require("stream").Readable;
var rs = new Readable(); // The readable stream
rs.push("beep "); // Add stuff
rs.push("boop \n"); // Add stuff
rs.push(null); // done outputting data
rs.pipe(process.stdout); // pipe to stdout writable stream
```

## Implementing a writable stream

```js
const { Writable } = require("stream");

const outStream = new Writable({
    write(chunk, encoding, callback) {
        console.log("\nchunk: ", chunk.toString());
        callback();
    }
});

process.stdin.pipe(outStream);
```

-   `chunk` is usually a buffer unless the stream is configured differently. `encoding` would be needed in that case
-   `callback` is called after done processing the chunk.

## Implementing a readable stream

```js
const { Readable } = require("stream");

const inStream = new Readable();

inStream.push("ABCDEFGHIJKLM");
inStream.push("NOPQRSTUVWXYZ");

inStream.pipe(process.stdout);
```
