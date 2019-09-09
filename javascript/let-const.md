# let and const

-   Block scope variables
-   Declaring twice in a block will throw a `SyntaxError`
-   Reassigning a `const` will throw a `TypeError`
-   Inner blocks can use the outer `let`/`const` variables or redeclare them, but not both. `var`/`function`/`function*` are all hoisted and initialized to undefined or the function when the binding is created at the top of the scope. `let`/`const`/`class` are hoisted but remain unitialized, so accessing them will throw a `ReferenceError`.

    ```js
    function letTest1() {
        let x = 1;
        if (true) {
            console.log(x); // 1
        }
    }
    letTest1();
    // 1

    function letTest2() {
        let x = 1;
        if (true) {
            let x = 2; // different variable
            console.log(x); // 2
        }
        console.log(x); // 1
    }
    letTest2();
    // 2
    // 1

    function letTest3() {
        let x = 1;
        if (true) {
            console.log(x);
            // Above this line in the block is the "Temporal Dead Zone"
            let x = 2;
            console.log(x);
        }
        console.log(x);
    }
    letTest3();
    // ReferenceError
    ```

-   var is scoped to the nearest function, let is scoped to the nearest block

    ```js
    function countLet() {
        //`i` is *not* visible out here

        for (let i = 0; i < 5; i++) {
            //`i` is only visible in here (and in the for() parentheses)
        }

        //`i` is *not* visible out here
    }

    function countVar() {
        //`i` is visible to the entire function

        for (var i = 0; i < 5; i++) {}
    }
    ```

-   In loops, you get a fresh binding for each iteration. Also works for `for-in` and `for-of`. `const` should be used in place of `let` in `for-in` and `for-of` whenever possible, however.

    ```js
    const varFuncs = [];
    for (var i = 0; i < 5; i++) {
        varFuncs.push(function() {
            console.log("the num is", i);
        });
    }
    varFuncs[0](); // the num is 5
    varFuncs[1](); // the num is 5

    // could be mitigated with IIFE or even better, `let`
    const letFuncs = [];
    for (let j = 0; j < 5; j++) {
        letFuncs.push(function() {
            console.log("the num is", j);
        });
    }
    letFuncs[0](); // the num is 0
    letFuncs[1](); // the num is 1
    ```
