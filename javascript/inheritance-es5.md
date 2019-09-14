# JavaScript Prototypal Inheritance in ES5

-   `Object.create()` requires polyfill in browsers that do not support ES5+
-   prototype object is shared across instances
-   The function is called the constructor.

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

## `Object.create` Polyfill

```js
if (typeof Object.create !== "function") {
    Object.create = function(proto, propertiesObject) {
        if (typeof proto !== "object" && typeof proto !== "function") {
            throw new TypeError("Object prototype may only be an Object: " + proto);
        } else if (proto === null) {
            throw new Error(
                "This browser's implementation of Object.create is a shim and doesn't support 'null' as the first argument."
            );
        }

        if (typeof propertiesObject != "undefined") {
            throw new Error(
                "This browser's implementation of Object.create is a shim and doesn't support a second argument."
            );
        }

        function F() {}
        F.prototype = proto;

        return new F();
    };
}
```
