# ES6 Modules

## Multiple Named Exports

```js
//------ lib.js ------
export const sqrt = Math.sqrt;
export function square(x) {
    return x * x;
}

//------ main1.js ------
import { sqrt, square } from "lib";
square(11);

//------ main2.js ------
import * as lib from "lib";
lib.square(11);
```

## Single Default Export

```js
//------ myFunc.js ------
export default function () { ··· } // no semicolon!

//------ main1.js ------
import myFunc from 'myFunc';
myFunc();
Or a class:

//------ MyClass.js ------
export default class { ··· } // no semicolon!

//------ main2.js ------
import MyClass from 'MyClass';
const inst = new MyClass();
```
