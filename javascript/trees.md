# Trees in JavaScript

```js
var Node = function(data, children) {
    this.data = data;
    this.children = [];
};

var Tree = function(data) {
    this._root = new Node(data);
};

// Post-Order
Tree.prototype.traverseDF = function(cb) {
    (function recurse(currentNode) {
        currentNode.children.forEach(function(element) {
            recurse(element);
        });

        cb(currentNode); // put this first for pre-order
    })(this._root);
};

Tree.prototype.traverseBF = function(callback) {
    var queue = [];
    var currentNode = this._root;
    while (currentNode) {
        for (var i = 0; i < currentNode.children.length; i++) {
            queue.push(currentNode.children[i]);
        }

        callback(currentNode);
        currentNode = queue.shift();
    }
};

Tree.prototype.contains = function(callback, traversal) {
    traversal.call(this, callback);
};

Tree.prototype.add = function(data, toData, traversal) {
    var child = new Node(data);
    var parent = null;

    this.contains(function(node) {
        if (node.data === toData) {
            parent = node;
        }
    }, traversal);

    if (parent) {
        parent.children.push(child);
    } else {
        throw new Error("Cannot add node to a non-existent parent.");
    }
};

Tree.prototype.remove = function(data, fromData, traversal) {
    var parent = null;
    var childToRemove = null;
    var index = 0;

    this.contains(function(node) {
        if (node.data === fromData) {
            parent = node;
        }
    }, traversal);

    if (parent) {
        for (var i = 0; i < parent.children.length; i++) {
            if (parent.children[i].data === data) {
                index = i;
            }
        }

        if (index === undefined) {
            throw new Error("Node to remove does not exist.");
        }

        return parent.children.splice(index, 1);
    } else {
        throw new Error("Parent does not exist");
    }
};

var tree = (function() {
    var t = new Tree("one");

    t.add("two", "one", t.traverseBF);
    t.add("three", "one", t.traverseBF);
    t.add("four", "one", t.traverseBF);
    t.add("five", "two", t.traverseBF);
    t.add("six", "two", t.traverseBF);
    t.add("seven", "four", t.traverseBF);

    return t;
})();
/*
 one
 ├── two
 │   ├── five
 │   └── six
 ├── three
 └── four
     └── seven
*/
```
