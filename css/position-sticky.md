# `position: sticky`

Element is positioned relative to its nearest scrolling ancestor and containing block. The element "sticks" when it gets to the defined position.

## Stacking panes example

```html
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width" />
        <style>
            .wrapper {
                padding: 20px;
            }

            .container {
                width: 100%;
                display: flex;
                position: relative;
            }

            .block {
                width: 50%;
            }

            .short {
                background: blue;
                height: 200px;
                position: sticky;
                top: 0;
            }

            .long {
                background: red;
                height: 1000px;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <div class="container">
                <div class="block short">aaaaaaaaaaaaaaa</div>
                <div class="block long">cccccccccccccc</div>
            </div>
            <div class="container">
                <div class="block long">bbbbbbbbbbbbbbb</div>
                <div class="block short">cccccccccccccc</div>
            </div>
        </div>
    </body>
</html>
```

## Stick to bottom

This is not like absolute positioning. Element order matters. The bottom element must be defined last.

```html
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width" />
    </head>
    <body>
        <div class="container">
            <div class="header">HEADER</div>
            <div class="content">MAIN CONTENT</div>
            <div class="footer">FOOTER</div>
        </div>
    </body>
</html>
```
