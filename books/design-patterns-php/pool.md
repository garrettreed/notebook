# Pool

## Purpose

-   Uses set of initialized objects kept ready to use
-   Keeps a pool of instances rather than allocating and destroying on demand
-   Performance boost when initializing cost is high

## Implementation

```php
<?php
class PoolTest extends \PHPUnit_Framework_TestCase
{
    public function testPool()
    {
        $pool = new Pool('TestWorker');
        $worker = $pool->get();

        $this->assertEquals(1, $worker->id);

        $worker->id = 5;
        $pool->dispose($worker);

        $this->assertEquals(5, $pool->get()->id);
        $this->assertEquals(1, $pool->get()->id);
    }
}

class TestWorker
{
    public $id = 1;
}

class Pool
{
    private $instances = array();
    private $class;
    public function __construct($class)
    {
        $this->class = $class;
    }
    public function get()
    {
        if (count($this->instances) > 0) {
            return array_pop($this->instances);
        }
        return new $this->class();
    }
    public function dispose($instance)
    {
        $this->instances[] = $instance;
    }
}

class Processor
{
    private $pool;
    private $processing = 0;
    private $maxProcesses = 3;
    private $waitingQueue = [];
    public function __construct(Pool $pool)
    {
        $this->pool = $pool;
    }
    public function process($image)
    {
        if ($this->processing++ < $this->maxProcesses) {
            $this->createWorker($image);
        } else {
            $this->pushToWaitingQueue($image);
        }
    }
    private function createWorker($image)
    {
        $worker = $this->pool->get();
        $worker->run($image, array($this, 'processDone'));
    }
    public function processDone($worker)
    {
        $this->processing--;
        $this->pool->dispose($worker);

        if (count($this->waitingQueue) > 0) {
            $this->createWorker($this->popFromWaitingQueue());
        }
    }
    private function pushToWaitingQueue($image)
    {
        $this->waitingQueue[] = $image;
    }
    private function popFromWaitingQueue()
    {
        return array_pop($this->waitingQueue);
    }
}

class Worker
{
    public function __construct()
    {
        // do some expensive work
    }
    public function run($image, array $callback)
    {
        // do something and then execute callback
        call_user_func($callback, $this);
    }
}
?>
```
