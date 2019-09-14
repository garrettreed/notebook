# Mixins

"Mixin" is an OOP term that means a class that contains methods for other classes. Really easy in JS with `Object.assign` and prototypal inheritance. Even easier if you just use objects and avoid classes/constructors.

```js
// mixin
var walkMixin = {
    walk() {
        console.log("I'M WALKIN HERE! and my name is " + this.name);
    }
};

// usage:
function User(name) {
    this.name = name;
}

// copy the methods
Object.assign(User.prototype, walkMixin);

// now User can say hi
new User("Gort").walk(); // I'M WALKIN HERE! and my name is Gort
```

Note that this is really similar to the inheritance method, except we don't need to reassign a constructor because the mixin is just an object.
