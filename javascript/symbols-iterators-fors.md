# Symbols, Iterators, and for's

Symbols can be set as non-enumerable ojbect keys:

```js
var isCool = Symbol();
// this doesn't work: var isCool = new Symbol();
```

Symbols are always unique so it's okay to use them to extend objects without worrying about

Many JS types are already decorated with symbols.
`Symbol.iterator` specifies the default iterator for an object. Assigning it to an object allows the use of `for...of`

`for...in` iterates over the enumarable properties of an object.
`for...of` iterates over data that iterable object defines to be iterated over.

```js
var obj = {};
obj[Symbol.iterator] = function() {
    var done = false;
    return {
        next: function() {
            if (done) {
                return { done: true };
            } else {
                var num = Math.random();
                if (num > 0.9) {
                    done = true;
                }
                return { done: false, value: num };
            }
        }
    };
};

for (var num of obj) {
    console.log(num);
}

// Logs 0.2592118112794619
//      0.5214201988831648
//      0.3123792504204661
//      0.9836294004422774
```
