# Cloning JavaScript Objects

## Shallow Clone

Use `Object.assign()` where supported:

```js
var obj = { one: 1, two: { three: 3, four: 4 } };
var clone = Object.assign({}, obj);

clone.one = 2;
obj.one; // 1
clone.one; // 2

clone.two.three = 4;
obj.two.three; // 4
clone.two.three; // 4
```

## Deep Clone

Works just for nested objects:

```js
function deepClone(target, obj) {
    Object.keys(obj).forEach(function(key) {
        if (typeof obj[key] === "object") {
            target[key] = {};
            deepClone(target[key], obj[key]);
        } else {
            target[key] = obj[key];
        }
    });
    return target;
}
```

Soooo many edge cases, especially because of arrays. Just use a library:

```js
function deepClone(source, destination) {
    var stackSource = [];
    var stackDest = [];

    if (destination) {
        if (Array.isArray(destination)) {
            destination = [];
        } else {
            destination = {};
        }

        stackSource.push(source);
        stackDest.push(destination);
        return copyRecurse(source, destination);
    }

    return copyElement(source);

    function copyRecurse(source, destination) {
        var key;
        if (Array.isArray(source)) {
            for (var i = 0, ii = source.length; i < ii; i++) {
                destination.push(copyElement(source[i]));
            }
        } else if (
            source !== null &&
            typeof source === "object" &&
            !Object.getPrototypeOf(source)
        ) {
            for (key in source) {
                if (source.hasOwnProperty(key)) {
                    destination[key] = copyElement(source[key]);
                }
            }
        } else if (source && typeof source.hasOwnProperty === "function") {
            for (key in source) {
                if (source.hasOwnProperty(key)) {
                    destination[key] = copyElement(source[key]);
                }
            }
        } else {
            for (key in source) {
                if (Object.prototype.hasOwnProperty.call(source, key)) {
                    destination[key] = copyElement(source[key]);
                }
            }
        }

        return destination;
    }

    function copyElement(source) {
        if (typeof source !== "object") {
            return source;
        }

        var index = stackSource.indexOf(source);
        if (index !== -1) {
            return stackDest[index];
        }

        var needsRecurse = false;
        var destination = copyType(source);

        if (destination === undefined) {
            destination = Array.isArray(source) ? [] : Object.create(Object.getPrototypeOf(source));
            needsRecurse = true;
        }

        stackSource.push(source);
        stackDest.push(destination);

        return needsRecurse ? copyRecurse(source, destination) : destination;
    }

    function copyType(source) {
        switch (Object.prototype.toString.call(source)) {
            case "[object Int8Array]":
            case "[object Int16Array]":
            case "[object Int32Array]":
            case "[object Float32Array]":
            case "[object Float64Array]":
            case "[object Uint8Array]":
            case "[object Uint8ClampedArray]":
            case "[object Uint16Array]":
            case "[object Uint32Array]":
                return new source.constructor(copyElement(source.buffer));

            case "[object ArrayBuffer]":
                if (!source.slice) {
                    var copied = new ArrayBuffer(source.byteLength);
                    new Uint8Array(copied).set(new Uint8Array(source));
                    return copied;
                }
                return source.slice(0);

            case "[object Boolean]":
            case "[object Number]":
            case "[object String]":
            case "[object Date]":
                return new source.constructor(source.valueOf());

            case "[object RegExp]":
                var re = new RegExp(source.source, source.toString().match(/[^\/]*$/)[0]);
                re.lastIndex = source.lastIndex;
                return re;

            case "[object Blob]":
                return new source.constructor([source], { type: source.type });
        }

        if (typeof source.cloneNode === "function") {
            return source.cloneNode(true);
        }
    }
}
```
