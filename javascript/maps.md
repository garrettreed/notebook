# Maps

## Big differences from objects

-   Maps can be iterated over insertion order
-   Maps can have keys of any type; Objects can only have strings or symbols

## API

-   Initialized with `new Map()`
-   `size`: Returns the number of key/value pairs in the Map object
-   `clear()`: Removes all key/value pairs from the instance.
-   `delete(key)`: Returns true if an element in the instance existed and has been removed, or false if the element does not exist.
-   `entries()`: Returns a new Iterator object that contains an array of [key, value] for each element in the instance in insertion order
-   `forEach(cb[, thisArg])`: Calls `cb` once for each pair present in the instance, in insertion order. If a thisArg parameter is provided to forEach, it will be used as the this value for each callback.
-   `get(key)`: Returns the value associated to the key, or undefined if there is none.
-   `has(key)`: Returns a boolean asserting whether a value has been associated to the key in the instance or not.
-   `keys()`: Returns a new Iterator object that contains the keys for each element in the Mapinstance in insertion order.
-   `set(key, value)`: Sets the value for the key in the Map object. Returns the Map object.

## Use

-   Initialized with `new Map()`
-   Can be initialized with an iterable:

    ```js
    // Can be initialized with an Iterable:
    const 2dArr = [['key1', 'value1'], ['key2', 'value2']];
    const theMap = new Map(2dArr);
    theMap.get('key1'); // "value1"
    ```

-   `get` to retrieve, `set` to set.

    ```js
    const obj = { a: 1 };
    const theMap = new Map();
    theMap.set(obj, "hello");
    theMap.get(obj); // hello

    // Values may be overwrittern
    theMap.set(obj, "goodbye");
    ```

## Summary

A Map object can iterate its elements in insertion order - a `for..of` loop will return an array of `[key, value]` for each iteration.

Objects are similar to Maps in that both let you set keys to values, retrieve those values, delete keys, and detect whether something is stored at a key. Because of this, Objects have been used as Maps historically; however, there are important differences between Objects and Maps that make using a Map better.

An Object has a prototype, so there are default keys in the map. However, this can be bypassed using `map = Object.create(null)`. The keys of an Object are Strings, where they can be any value for a Map. You can get the size of a Map easily while you have to manually keep track of size for an Object.

## WeakMap

Like `Map`, but only allows for objects types as keys. Pairs may be garbage collected if there are no other references to the object

```js
const wm = new WeakMap();
{
    const obj = {};
    wm.set(obj, "this is a");
}
// `a` is no longer referenced after the block, so it may be garbage collected
// For demonstration:
//    1. Run the above code in the chrome console
//    2. Click the down
//    3. Clear the console. Otherwise the console will keep a reference to `obj`.
//    4. Go to the "Memory" tab and click "Collect Garbage"
//    5. Return to the console and inspect `wm` again. It's now empty.
```
