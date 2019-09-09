# JavaScript Prototypal Inheritance in ES5

-   `Object.create()` requires polyfill in browsers that do not support ES5+
-   prototype object is shared across instances
-   The function is called the constructor. Instances are just instances.

```js
function Person(name) {
    this.name = name;
}
Person.prototype.sayName = function() {
    console.log("Hi, I am " + this.name);
};

function Employee(name, position) {
    Person.call(this, name);
    this.position = position;
}
Employee.prototype = Object.create(Person.prototype);
// TODO: check this
// I believe this would also work if Object.create/polyfill isn't available
//Employee.prototype.__proto__ = Person.prototype;
Employee.prototype.constructor = Employee;
Employee.prototype.sayPosition = function() {
    console.log("i work as a " + this.position);
};

var bob = new Person("bob");
var tim = new Employee("tim", "plumber");

tim instanceof Employee; // true
tim instanceof Person; // true
bob.__proto__.isPrototypeOf(tim); // true
```

More with Object.create
