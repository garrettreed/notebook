# Introduction to Angular from the documentation site

## Use

Built with CRUD applications, not for Games and GUI Editors or others with tricky DOM manipulation
See the learn-angular repo for a working example this stuff

## The Zen of Angular

-   Decouple DOM mainipulation from app logic
-   Emphasis on testing
-   Removes callback registering
-   Programmatic DOM Manipulation

### Brief Glossary

-   Template: HTML with added markup
-   Directives: extend HTML with custom attr and elements
-   Model: the data shown to the user in the view and with which the user interacts
-   Scope: model context for access by controllers, directives, and expressions
-   Expressions: access vars and funcs from the scope
-   Compiler: parses template and instantiates directives and expressions
-   Filter: formats value of expression for display to user
-   View: DOM
-   Data Binding: sync between model and view
-   Controller: app logic behind views
-   Dependency Injection: creates and wires objects and functions
-   Injector: dep injection container
-   Module: container for the different parts of an app. Includes controllers, services, filters, and directives which configures the injector
-   Service: reusable business logic independent of views

## Data Binding

2-way, automatic sync between model and view. This is nice.

## Controllers

A constructor function that is used to augment the angular scope.
When `ng-controller` directive is used, angular instantiates a new controller object using the specified controller constructor. A new child scope will be available as injectable param to the constructor function as `$scope`
Use Controllers to set up the initial state of \$scope and add behavior
Don't use controllers to:

-   Manipulate DOM - databinding and directives
-   Format Input - form controls
-   Filter output - filters
-   Share code or state - services
-   Manage other components lifecycle, ex create services instances
     Only use controllers to provide logic needed for a single view. Encapsulate work that doesn't belong into services
     `$scope` is nested along with DOM hierarchy

## Services

Substitutable objects wired together using DI
Lazily instantiated - Instantiated when an application depends on it
Singletons - Each component dependent on a service gets a ref to the single instance generated by the service factory
Some common Core Services: `$http`, `$cacheFactory`, `$filter`, `$parse`, `$animate`, `$q` (promises)

### Using a Service

Add it as a dependency for the component (controller, service, filter, directive) that takes care of it.

### Dependencies

Just like with controllers, the dependencies come before the service function

## Scopes

Scope is an object that refers to the model and is an execution context for expressions.

### Characteristics

-   `$watch` to observe model changes
-   `$apply` to send model changes through the system into the view
-   Can be nested to limit access. Child scopes prototypically inherit props from parent scope. Isolate scopes do not.
-   `{{username}}` is meaningless unless evaluated against as cope which defines `username` property

### Scope as Data-Model

-   Scope is glue between controller and view. `$watch` notifies directives of prop changes
-   `$rootScope` is a service component that allows for the application's root scope to be accessed at any point
-   Angular auto places `ng-scope` class on elements where scopes are attached.

### Scope Events

-   `$braodcast(name, args)` dispatches an event downwards to all child scopes and their children notifying the registered `$rootScope.Scope` listeners
-   `$emit(name, args)` dispatches event upwards to all parents

## Dependencies

### Understanding the Dependency declaration syntax

The recommended way is inline array annotation:

```js
someModule.controller('MyController', ['$scope', 'greeter', function($scope, greeter) { ... }]);
```

This may be broken apart using the `$inject` property annotation:

```js
var MyController = function($scope, greeter) { ... }
MyController.$inject = ['$scope', 'greeter'];
someModule.controller('MyController', MyController);
```

Implicit declaration assumes that the function param is the dependency name, but this breaks the code if it is minified, so it is not recommended:

```js
someModule.controller('MyController', function($scope, greeter) { ... });
```
