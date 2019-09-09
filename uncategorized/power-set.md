# The Power Set

[1,2,3,4]:
[[],[1],[2],[3],[1,2],[1,3],[2,3],[1,2,3]]
Length is 2^2

Iterative solution that builds on itself:

```js
function powerset(arr) {
    var result = [[]];

    for (var i = 0; i < arr.length; i++) {
        var len = result.length;
        for (var j = 0; j < len; j++) {
            result.push(result[j].concat(arr[i]));
        }
    }

    return result;
}
```

Recursive solution:

The powerset of abcd is the union of the power-sets of abc, abd, acd (plus the set abcd itself).

P(`abcd`) = {`abcd`} + P(`abc`) + P(`abd`) + P(`acd`) + P(`bcd`)

```
function powerset(l) {
    return (function ps(list) {
        if (list.length === 0) {
            return [[]];
        }
        var head = list.pop();
        var tailPS = ps(list);
        return tailPS.concat(tailPS.map(function(e) { return [head].concat(e); }));
    })(l.slice());
}
```
