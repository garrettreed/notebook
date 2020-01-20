# How `new` works

```js
function Car(color) {
    this.color = color;
}
Car.prototype.wheels = 4;

var myCar = new Car("blue");
```

When `new Car()` is called, 4 things happen:

1. A new object is created that inherits from `Car.prototype` (`myCar.__proto__ === Car.prototype`)
2. `constructor` of new object is set to `Car`
3. Calls the constructor function with object as context (`this`).
4. Implictly returns `this`

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
