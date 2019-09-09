# Simple Factory

## Purpose

-   Not static, because static is global and global is bad
-   Can have multiple factories with different parameters
-   Can be subclassed

## Implementation

```php
<?php
class SimpleFactoryTest extends \PHPUnit_Framework_TestCase
{
    protected $factory;
    protected function setUp()
    {
        $this->factory = new ConcreteFactory();
    }
    public function getType()
    {
        return array(
            array('bicycle'),
            array('other')
        );
    }
    public function testCreation($type)
    {
        $obj = $this->factory->createVehicle($type);
        $this->assertInstanceOf('DesignPatterns\Creational\SimpleFactory\VehicleInterface', $obj);
    }
    public function testBadType()
    {
        $this->factory->createVehicle('car');
    }
}

class ConcreteFactory
{
    protected $typeList;
    public function __construct()
    {
        $this->typeList = array(
            'bicycle' => __NAMESPACE__.'\Bicycle',
            'other'   => __NAMESPACE__.'\Scooter'
        );
    }
    public function createVehicle($type)
    {
        if (!array_key_exists($type, $this->typeList)) {
            throw new InvalidArgumentException('$type is not a valid vehicle');
        }
        $classname = $this->typeList[$type];
        return new $className();
    }
}

interface VehicleInterface
{
    public function driveTo($destination);
}

class Bicycle implements VehicleInterface
{
    public function driveTo($destination)
    {
    }
}

class Scooter implements VehicleInterface
{
    public function driveTo($destination)
    {
    }
}
?>
```
