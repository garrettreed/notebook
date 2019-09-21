# `useRef` Hook

-   Primarily used to reference the dom node of the component, but not limited to that.
-   Three ways to store variables in functional components
    -   `const`/`let`, where the value will be reinitialized with every component render
    -   `useState`, where the value will persist across renders, and changing the value will trigger a re-render
    -   `useRef`, where the value will persist across renders, but changing will not trigger a re-render by itself. Accessed value via `refName.current`

## DOM Node Ref

```js
function MyComponent(props) {
    var elem = React.useRef();
    elem.current.focus() // force focus when mounted
    return React.createElement('input', {ref=elem, placeholder="name"})
}
```

## Concurrent Mode

https://medium.com/better-programming/how-to-properly-use-the-react-useref-hook-in-concurrent-mode-38c54543857b

Why isn't useEffect firing on initial render? Maybe try outside of codepen?

```js
function MyComponent(props) {
    var elem = React.useRef();
    [thing, setThing] = React.useState(1);

    React.useEffect(function() {
        console.log("in use effect");
        console.log(elem.current);
        elem.current.focus(); // force focus when mounted
    }, []);

    function handleChange() {
        setThing(thing + 1);
    }

    return React.createElement(
        "input",
        { ref: elem, placeholder: "name", onChange: handleChange },
        null
    );
}

ReactDOM.render(React.createElement(MyComponent), document.getElementById("app"));
```
