# Angular Directives

## Example

[In action](http://jsbin.com/gupesov/1/edit?html,js,output)

```html
<!-- example usage: -->
<div my-example max="77"></div>
```

```js
angular.module("example").directive("myExample", myExample);

function myExample() {
    var directive = {
        restrict: "EA",
        templateUrl: "app/feature/example.directive.html",
        scope: {
            max: "="
        },
        controller: ExampleController,
        controllerAs: "vm",
        bindToController: true // because scope is isolated. Allows access to max
    };

    return directive;
}

function ExampleController() {
    var vm = this; // get the scope;
    vm.min = 3;
    console.log("CTRL: vm.min = %s", vm.min); // 3
    console.log("CTRL: vm.max = %s", vm.max); // 77
}
```

```html
<!-- example.directive.html -->
<div>hello world</div>
<div>max={{vm.max}}<input ng-model="vm.max" /></div>
<div>min={{vm.min}}<input ng-model="vm.min" /></div>
```

## Restriction

-   A directive is restricted to attribute and elements only be default. Can be expanded with `restrict` option
-   `restrict` can be set to
    -   `'A'` - only matches attribute name
    -   `'E'` - only matches element name
    -   `'C'` - only matches class name
    -   `'M'` - only matches comment
-   can be combined
    -   `'AEC'` - matches attribute, element, or class
