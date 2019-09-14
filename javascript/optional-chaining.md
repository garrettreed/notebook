# Optional Chaining function

```js
function optChain(arg, ...chain) {
    var current = arg;
    for (var i = 0; i < chain.length; i++) {
        if (!current[chain[i]]) {
            return undefined;
        }
        current = current[chain[i]];
    }
    return current;
}

var nest = {
    a: { b: 1 },
    c: { d: { e: 42 } }
};

optChain(nest, "a", "b");
```

Future Sytnax: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining
