# Classes (ES6)

Just special functions that contain class expressions and class declarations.

## Class Declarations

```js
class Ploygon {
    constructor(height, width) {
        this.height = height;
        this.width = width;
    }
}
```

### Hoisting

Classes are not hoisted like functions.

```js
var p = new Polygon(); // ReferenceError
class Polygon {}
```

## Class Expressions

Alternative way to define a class. Can be named or unnamed. Name is local to the class body

```js
// unnamed
var Polygon = class {
    constructor(height, width) {
        this.height = height;
        this.width = width;
    }
};

// named
var Polygon = class Polygon {
    constructor(height, width) {
        this.height = height;
        this.width = width;
    }
};
```

## Class Body and method definitions

### Prototype Methods

```js
class Polygon {
    constructor(height, width) {
        this.height = height;
        this.width = width;
    }

    get area() {
        return this.calcArea();
    }

    calcArea() {
        return this.height * this.width;
    }
}

const square = new Polygon(10, 10);

console.log(square.area);
```

Weird prototype quirk:

-   The functions are in fact added to the prototype but are not enumerable.
-   To view the available prototype properties defined using class syntax, use `Object.getOwnPropertyNames(MyClass.prototype)`

### Static Methods

-   Can Be called without instantiating.
-   Not callable when instantiated.

```js
class Point {
    constructor(x, y) {
        this.x = x;
        this.y = y;
    }

    static distance(a, b) {
        const dx = a.x - b.x;
        const dy = a.y - b.y;

        return Math.sqrt(dx*dx + dy*dy);
    }
}

const p1 = new Point(5, 5);
const p2 = new Point(10, 10);

console.log(Point.distance(p1, p2);

/*
* > Object.getOwnPropertyNames(Point)
* [ 'length', 'name', 'prototype', 'distance' ]
* > Object.getOwnPropertyNames(p1)
* [ 'x', 'y' ]
*/
```

## Subclassing with `extends` and `super`

```js
class Animal {
    constructor(name) {
        this.name = name;
    }

    speak() {
        console.log(this.name + " makes a noise");
    }
}

class Dog extends Animal {
    speak() {
        super.speak();
        console.log(this.name + " roars.");
    }
}
```
