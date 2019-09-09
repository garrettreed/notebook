# Builder

## Purpose

-   An interface that builds parts of a complex object
-   The director knows the interface of the builder and builds a complex object with the help of the builder.

## Implementation

```php
<?php
class DirectorTest extends \PHPUnit_Framework_TestCase
{
    protected $director;
    protected function setUp()
    {
        $this->director = new Director();
    }
    public function getBuilder()
    {
        return array(
            array(new CarBuilder()),
            array(new BikeBuilder())
        );
    }
    public function testBuild(BuilderInterface $builder)
    {
        $newVehicle = $this->director->build($builder);
        $this->assertInstanceOf('Vehicle', $newVehicle);
    }
}

class Director
{
    public function build(BuilderInterface $builder)
    {
        $builder->createVehicle();
        $builder->addDoors();
        $builder->addEngine();
        $builder->addWheel();
        return $builder->getVehicle()
    }
}

interface BuilderInterface
{
    public function createVehicle();
    public function addWheel();
    public function addEngine();
    public function addDoors();
    public function getVehicle();
}

class BikeBuilder implements BuilderInterface
{
    protected $bike;
    public function addDoors()
    {
    }
    public function addEngine()
    {
        $this->bike->setPart('engine'.new Engine());
    }
    public function addWheel()
    {
        $this->bike->setPart('forwardWheel', new Wheel());
        $this->bike->setPart('rearWheel', new Wheel());
    }
    public function createVehicle()
    {
        $this->bike = new Bike();
    }
    public function getVehicle()
    {
        return $this->bike;
    }
}

class CarBuilder implements BuilderInterface
{
    protected $car;
    public function addDoors()
    {
        $this->car->setPart('rightdoor', new Door());
        $this->car->setPart('leftDoor', new Door());
    }
    public function addEngine()
    {
        $this->car->setPart('engine', new Engine());
    }
    public function addWheel()
    {
        $this->car->setPart('wheelLF', new Wheel());
        $this->car->setPart('wheelRF', new Wheel());
        $this->car->setPart('wheelLR', new Wheel());
        $this->car->setPart('wheelRR', new Wheel());
    }
    public function createVehicle()
    {
        $this->car = new PartsCar();
    }
    public function getVehicle()
    {
        return $this->car;
    }
}

abstract class Vehicle
{
    protected $data;
    public function setPart($key, $value)
    {
        $this->data[$key] = $value;
    }
}

class Bike extends Vehicle
{}
class Car extends Vehicle
{}
class Engine
{}
class Wheel
{}
class Door
{}
?>
```
