# `prototype` vs `__proto__`

-   `__proto__` is the actual object used in the lookup chain.
-   `prototype` is the object that is used to build `__proto__` when an object is created with `new`.
-   `Object.getPrototypeOf(obj)` is equivalent to `obj.__proto__` and is the preferred way of accessing the object.

```js
var a = new String();
a.__proto__ === String.prototype; // true
a.prototype === undefined; // true
a.constructor === String; // true
```
