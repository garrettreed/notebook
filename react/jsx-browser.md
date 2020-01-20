# Use Babel Standalone to compile jsx at runtime in the browser

If you use non-inline scripts, this needs to run on an http server. Local files will not work because it uses xhr to fetch the files.

```html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>React Local</title>
        <script
            type="application/javascript"
            src="https://unpkg.com/react@16.0.0/umd/react.production.min.js"
        ></script>
        <script
            type="application/javascript"
            src="https://unpkg.com/react-dom@16.0.0/umd/react-dom.production.min.js"
        ></script>
        <script
            type="application/javascript"
            src="https://unpkg.com/babel-standalone@6.26.0/babel.js"
        ></script>
    </head>

    <body>
        <div id="root"></div>

        <script type="text/babel" src="./test.jsx"></script>
    </body>
</html>
```
