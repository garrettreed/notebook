# Symbols, Iterators, and for's

Symbols can be set as non-enumerable ojbect keys:

```js
// unique identifier named isCool
var isCool = Symbol();

// you can add a description, which can be useful for debugging
var symbolWithDescription = Symbol("hello!");

// this doesn't work: var isCool = new Symbol();
```

Symbols are always unique so it's okay to use them to extend objects without worrying about naming conflicts or overwriting properties.

```js
let user = {
    name: "Grem"
};
let id = Symbol("id");
user[id] = 1;
console.log(user[id]);
```

Symbols in a literal have to use bracket syntax:

```js
let id = Symbol("id");

let user = {
    name: "Grem",
    [id]: 123 // not "id: 123"
};
```

Symbols are skipped by for...in loops. `Object.keys` also ignores them.

## Global Symbols

A symbol can be defined for global use.
Reading a symbol from this registry: `Symbol.for("key")`. If it doesn't exist, it will be crated.

```js
// read from the global registry
let id = Symbol.for("id"); // if the symbol did not exist, it is created

// read it again (maybe from another part of the code)
let idAgain = Symbol.for("id");

// the same symbol
alert(id === idAgain); // true
```

## System Symbols

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

Other examples:

-   `Symbol.hasInstance`
-   `Symbol.isConcatSpreadable`
-   `Symbol.toPrimitive`
-   Others: https://tc39.es/ecma262/#sec-well-known-symbols
