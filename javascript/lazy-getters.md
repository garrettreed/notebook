# Lazy Getters

Getters give you a way to define a property of an object, but they do not calculate the property's value until it is accessed. A getter defers the cost of calculating the value until the value is needed, and if it is never needed, you never pay the cost.

An additional optimization technique to lazify or delay the calculation of a property value and cache it for later access are lazy/smart/memoized getters.

```js
function MyObject() {}

Object.defineProperty(MyObject.prototype, "lazyProp", {
    get: function() {
        var lazyProp = Math.round(Math.random() * 100000);

        Object.defineProperty(this, "lazyProp", {
            value: lazyProp
        });

        return lazyProp;
    }
});

var o = new MyObject();
var p = new MyObject();

console.log(o.lazyProp);
console.log(o.lazyProp);

console.log(p.lazyProp);
console.log(p.lazyProp);
```
