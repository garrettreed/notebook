# Factory Method

## Purpose

-   Can be subclassed to implement different ways to create objects
-   Depends on abstractions, not concrete classes, compared to SimpleFactory or StaticFactory

## Implementation

```php
<?php
class FactoryMethodTest extends \PHPUnit_Framework_TestCase
{
    protected $type = array(
        FactoryMethod::CHEAP,
        FactoryMethod::FAST
    );
    public function getShop()
    {
        return array(
            array(new GermanFactory()),
            array(new ItalianFactory())
        );
    }
    public function testCreation(FactoryMethod $shop)
    {
        foreach ($this->type as $oneType) {
            $vehicle = $shop->create($oneType);
            $this->assertInstanceOf('VehicleInterface', $vehicle);
        }
    }
    public function testUnknownType(FactoryMethod $shop)
    {
        $shop->create('spaceship');
    }
}

abstract class FactoryMethod
{
    const CHEAP = 1;
    const FAST = 2;

    abstract protected function createVehicle($type);
    public funtion create($type)
    {
        $obj = $this->createVehicle($type);
        $obj->setColor('$f00');
        return $obj;
    }
}

class ItalianFactory extends FactoryMethod
{
    protected function createVehicle($type)
    {
        switch ($type) {
            case parent::CHEAP:
                return new Bicycle();
                break;
            case parent::FAST:
                return new Ferrari();
                break;
            default:
                throw new InvalidArgumentException("$type is not a valid vehicle");
        }
    }
}

class GermanFactory extends FactoryMethod
{
    protected function createVehicle($type)
    {
        switch ($type) {
            case parent::CHEAP:
                return new Bicycle();
                break;
            case parent::FAST:
                $obj = new Porsche();
                $obj->addTuningAMG();
                return $obj;
                break;
            default:
                throw new \InvalidArgumentException("$type is not a valid vehicle");
        }
    }
}

interface VehicleInterface
{
    public function setColor($rgb);
}

class Porsche implements VehicleInterface
{
    protected $color;
    public function setColor($rgb)
    {
        $this->color = $rgb;
    }
    public function addTuningAMG()
    {
    }
}

class Bicycle implements VehicleInterface
{
    protected $color;
    public function setColor($rgb)
    {
        $this->color = $rgb;
    }
}

class Ferrari implements VehicleInterface
{
    protected $color;
    public function setColor($rgb)
    {
        $this->color = $rgb;
    }
}
?>
```
