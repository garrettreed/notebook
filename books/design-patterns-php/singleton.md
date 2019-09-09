# Singleton

## Purpose

-   Is an antipattern, mostly because it introduces global state, but it's commonly used, so the implementation is shown.
-   It is better to use dependency injection
-   Have only one instance of the object in the entire application
-   Examples: DB Connector, Logger, Lock file

## Implementation

```php
<?php
class TestSingleton
{
    public function testUniqueness()
    {
        $firstCall = Singleton::getInstance();
        $this->assertInstanceOf('Singleton', $firstCall);
        $secondCall = Singleton::getInstance();
        $this->assertSame($firstCall, $secondCall);
    }
    public function testNoConstructor()
    {
        $obj = Singleton::getInstance();
        $refl = new ReflectionObject($obj);
        $meth = $refl->getMethod('__construct');
        $this->assertTrue($meth->isPrivate());
    }
}

class Singleton
{
    private static $instance;

    public static function getInstance()
    {
        if (null === static::$instance) {
            static::$instance = new static;
        }
        return static::$instance;
    }
    private function __construct()
    {
    }
    private function __clone()
    {
    }
    private function __wakeup()
    {
    }
}
?>
```
