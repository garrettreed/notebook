# Abstract Factory

http://design-patterns-php.readthedocs.io/en/latest/Creational/AbstractFactory/README.html

## Purpose

-   Create related classes that typically share the same interface
-   Implements the Dependency Inversion Principle because it is a concrete subclass which creates concrete components.

## Implementation

```php
<?php
class AbstractFactoryTest extends \PHPUnit_Framework_TestCase
{
    public function getFactories()
    {
        return array(
            array(new JsonFactory()),
            array(new HtmlFactory())
        );
    }

    public function testComponentCreation(AbstractFactory $factory)
    {
        $article = array(
            $factory->createText('Lorem Ipsum'),
            $factory->createPicture('/image.jpg', 'caption'),
            $factory->createText('footnotes');
        )
        $this->assertContainsOnly('MediaInterface', $article);
    }
}

abstract class AbstractFactory
{
    abstract public function createText($content);
    abstract public function createPicture($path, $name = '');
}

class JsonFactory extends AbstractFactory
{
    public function createPicture($path, $name = '')
    {
        return new JsonPicture($path, $name);
    }
    public function createText($content)
    {
        return new JsonText($content);
    }
}

class HtmlFactory extends AbstractFactory
{
    public function createPicture($path, $name = '')
    {
        return new HtmlPicture($path, $name);
    }
    public function createText($content)
    {
        return new HtmlText($content);
    }
}

interface MediaInterface
{
    public function render();
}

abstract class BasePicture implements MediaInterface
{
    protected $path;
    protected $name;
    public function __construct($path, $name = '')
    {
        $this->name = (string) $name;
        $this->path = (string) $path;
    }
}

abstract class BaseText implements MediaInterface
{
    protected $text;
    public function __construct($text)
    {
        $this->text = (string) $text;
    }
}

class JsonPicture extends BasePicture
{
    public function render()
    {
        return json_encode(array('title' => $this->name, 'path' => $this->path));
    }
}

class JsonText extends BaseText
{
    public function render()
    {
        return json_encode(array('content' => $this->text));
    }
}

class HtmlPicture extends BasePicture
{
    public function render()
    {
        return sprintf('<img src="%s" title="%s"/>', $this->path, $this->name);
    }
}

class HtmlText extends BaseText
{
    public function render()
    {
        return '<div>'.htmlspecialchars($this->text).'</div>';
    }
}
?>
```
