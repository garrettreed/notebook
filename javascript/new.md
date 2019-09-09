# How `new` works

```js
function Car(color) {
    this.color = color;
}
Car.prototype.wheels = 4;

var myCar = new Car("blue");
```

When `new Car()` is called, 4 things happen:

1. New object is created
2. `constructor` of object is set to type `Car`
3. Object's prototype is set to Car's prototype
4. `Vehicle()` is called from the context of the new object

Instead of `new`, you could do the following:

```js
// sets the values of prototype and constructor
var myCar = Object.create(Car.prototype);

Car.call(myCar, "blue");
// or myCar.constructor.call(myCar, 'blue');
```

Or even without the use of `Object.create()`

```js
var myCar = {};
myCar.__proto__ = Car.prototype;
Car.call(myCar, "blue");
```
