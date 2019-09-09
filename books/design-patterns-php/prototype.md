# Prototype

## Purpose

-   Create objects by cloning a prototype

## Implementation

```php
<?php
class TestPrototype
{
    for ($i = 0; $i < 10000; $i++) {
        $book = clone $fooPrototype;
        $book->setTitle('Foo Book No ' . $i);
    }
    for ($i = 0; $i < 5000; $i++) {
        $book = clone $barPrototype;
        $book->setTitle('Bar Book No ' . $i);
    }
}

abstract class BookPrototype
{
    protected $title;
    protected $category;
    abstract public function __clone();
    public function getTitle()
    {
        return $this->title;
    }
    public function setTitle($title)
    {
        $this->title = $title;
    }
}

class BarBookPrototype extends BookPrototype
{
    protected $category = 'Bar';
    public function __clone()
    {
    }
}

class FooBookPrototype extends BookPrototype
{
    protected $category = 'Foo';
    public function __clone()
    {
    }
}
?>
```
