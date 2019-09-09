# instanceof

Checks the prototype chain for constructor names.

```js
var a = [];
a instanceof Array; // true

var Animal = function(name) {
    this.name = name;
};
var Dog = function(name, breed) {
    Animal.call(this, name);
    this.breed = breed;
};
Dog.prototype = Object.create(Animal.prototype);
var tim = new Dog("tim", "unknown");
tim instanceof Animal; // true
tim instanceof Dog; // true
```
