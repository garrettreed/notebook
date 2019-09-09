# `Object.defineProperty`

## Syntax

`Object.defineProperty(obj, prop, descriptor)`

-   obj: Object on which to define property
-   prop: String to represent the property name
-   descriptor: The getter/setter object
    -   configurable: can this prop be changed and deleted? **default false**
    -   enumerable: can this prop be iterated over in `for...in` or `Object.keys()`? **default false**
    -   value: is there a value associated with this prop? **default undefined**
    -   writable: can you assign a value to the prop with `=`? **default undefined**
    -   `get()`
    -   `set(newVal)`

## Notes

-   `TypeError` A property cannot both have accessors and be writable or have a value

## Example

Keeping `firstName`, `lastName`, and `fullName` synchronized across an object. I guess you could call it a dynamic property.

```js
function Person(first, last) {
    this.firstName = first;
    this.lastName = last;
}

Object.defineProperty(Person.prototype, "fullName", {
    set: function(value) {
        var parts = value.split(" ");
        if (parts.length === 2) {
            this.firstName = parts[0];
            this.lastName = parts[1];
        }
    },
    get: function() {
        return this.firstName + " " + this.lastName;
    }
});
```
