# IoC Container

Tool for managing class dependencies through dependency injection.

## Basic Usage

### Bind a type to the container

```php
App::bind('foo', function($app)
{
    return new FooBar;
});
```

### Resolve the type

```php
$value = App::make('foo'); ?>
```

### Bind a Shared Type

Only reolve once and return the same instance on subsequent calls. Could be considered an antipattern.

```php
App::singleton('foo', function()
{
    return new FooBar;
});
```

### Bind an existing instance

```php
$foo = new Foo;
App::instance('foo', $foo);
```

## Registering Bindings

-   Typically registered someplace where app is bootstrapped.
-   Airtype has registered our custom bindings in `Foundation/BootstrapServiceProvider.php`. Each binding has its own service provider.
