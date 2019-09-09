# Teaching reference vs value

Start with simple equality:

```js
var a = 5;
var b = 5;
a === b; // true

var c = [1, 2, 3];

var d = [1, 2, 3];

c === d; // false
```

The functions are identical, just like the numbers. Why aren't they equal? This is because the numbers are compared by _values_, where the functions are compared by _reference_.

Javascript has 5 types that are compared by value. They're typically referred to as **primitive** types. These are `Boolean`, `null`, `undefined`, `String`, and `Number`:

```js
var a = true, b = true;
a === b // true

var c = null, d = null;
c === d // true

var e = undefined, f = undefined;
e === f // true

var g = 'hello', h = 'hello;
g === h // true

var i = 5, j = 5;
j === j // true
```

Everything else is a non-primitive value. These include Objects, Arrays, and Functions, among others.
Any non-primitive value assigned to a variable is actually assigned a reference to that value. This reference just points to that location in memory.

For example, when we declare an array, `var arr = [1,2,3]`, first that array is built in memory, and `arr` is assigned the reference to it. Compare this to declaring a String, `var str = 'hello'`, the string value is stored at the memory location defined by `str`.

So when are two variables containing non-primitive values equal? Only when they share the same reference:

```js
var a = [1, 2, 3];
var b = a;
a === b; // true
```

Remember, the variables only hold a reference to the function, so changing one will not change the other.

```js
var a = [1, 2, 3];
var b = a;
console.log(b); // [1,2,3]
b = 4;
console.log(b); // 4
console.log(a); // [1,2,3];
```
