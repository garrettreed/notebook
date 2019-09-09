# Observer Pattern in JavaScript

```js
class Subject {
    constructor() {
        this.observers = [];
    }

    notifyObservers() {
        this.observers.forEach(
            function(observer) {
                observer.update(this);
            }.bind(this)
        );
    }

    registerObserver(observer) {
        this.observers.push(observer);
    }

    removeObserver(observer) {
        this.observers = this.observers.filter(function(o) {
            return o !== observer;
        });
    }
}

class Observer {
    update() {
        throw new Error("`update` not implemented in observer!");
    }
}

class Book extends Subject {
    constructor(title) {
        super();
        this.title = title;
        this.currentPage = 1;
    }

    pageTurn(delta = 1) {
        this.currentPage += delta;
        this.notifyObservers();
    }
}

class BookTracker extends Observer {
    constructor(books = []) {
        super();
        books.forEach(
            function(book) {
                this[book.title] = book.currentPage;
                book.registerObserver(this);
            }.bind(this)
        );
    }

    addBook(book) {
        this[book.title] = book.currentPage;
    }

    getPage(book) {
        return this[book.title];
    }

    update(book) {
        this[book.title] = book.currentPage;
    }
}

var gow = new Book("Grapes of Wrath");
var omm = new Book("Of Mice and Men");

var books = new BookTracker([gow, omm]);
gow.pageTurn(10);
console.log(gow.currentPage); // 11;
console.log(books["Grapes of Wrath"]); // 11
```
