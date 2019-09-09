# The Laravel Request Lifecycle

-   Requests, application events, bootstrapping/start events

## Lifecycle

-   All requests begin by passing through `public/index.php`
-   `bootstrap/start.php` is loaded. Creates a new Laravel `Application` object, which serves as an IoC Container
-   Paths are set in `bootstrap/paths.php`
-   Environment is detected in `bootstrap/start.php`
-   Laravel core bootstrap script sets settings based on configuration: timezone, error reporting, etc. and registers service providers
-   start files are loaded
-   `app/routes.php` is loaded
-   Request object is sent to application to be dispatched to a route
-   Response object sent back to client

## Service Providers

-   The most important concept to grasp when learning the bootstrap process
-   Contained in the `providers` array of `app/config/app.php`
-   Simple providers only have one `register` method. Called when registered with the application object's own register method
-   Things are registered with the IoC container using the above method
-   Each provider binds one or more closures into the container
-   Doesn't have to just register things with the IoC container
-   Can also register event listeners, view composers, artisan commands

## Start Files

-   Simple place to store any bootstrapping code
-   Stored in `app/start/`
-   Defaults: `global.php`, `local.php`, `artisan.php`
-   `global.php`: registers logger, `app/filters.php`. Included in every environment.
-   `local.php`: only called in local environment
-   Start files may be created for other environments. Automatically parsed and included according to `bootstrap/start.php` environments.

## Application Events

-   `before` runs before each request
-   `after` runs after each request
-   `matched` runs after a request has been successfully matched with a route, but before execution
-   `finish` runs after the response is sent to client
-   `shutdown` runs after all `finish` event handlers have finished.

```php
<?php
App::before(function($request)
{
    //
});
App::after(function($request, $response)
{
    //
});
Route::matched(function($route, $request)
{
    //
});
?>
```
