# Static Factory

## Purpose

-   Similar to AbstractFactory, creates related or dependent objects
-   Uses one static method to create all types of objects, named `factory` or `build`

## Implementation

```php
<?php
class StaticFactoryTest extends \PHPUnit_Framework_TestCase
{
    public function getTypeList()
    {
        return array(
            array('string'),
            array('number')
        );
    }
    public function testCreation($type)
    {
        $obj = StaticFactory::factory($type);
        $this->assertInstanceOf('FormatterInterface', $obj);
    }
    public function testException()
    {
        StaticFactory::factory("");
    }
}

class StaticFactory
{
    public static function factory($type)
    {
        $className = __NAMESPACE__.ucfirst($type);
        if (!class_exists($className)) {
            throw new InvalidArgumentException('Missing format class.');
        }
        return new $className();
    }
}

class FormatString implements FormatterInterface
{
}

class FormatNumber implements FormatterInterface
{
}
?>
```
