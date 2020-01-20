# React Portals

-   Allows rendering child components outside the dom heirarchy of the parent component.
-   Can be especially useful for modals, tooltips, anything that would be easier positioned relative to the body.
-   Possible to use as a sort of multi-app with shared state. TODO: Take notes on use with Context: https://dev.to/mickmister/sharing-context-with-react-portals-4dki

```html
<body>
    <div id="root"></div>
    <header id="header"></header>
    <main>This is a static body</main>
    <footer id="footer"></footer>

    <script>
        function Main() {
            // Don't actually use one big state object, please.
            const [masterState, setMasterState] = React.useState({
                headerText: "This is the header",
                footerText: "This is the footer"
            });

            return React.createElement(
                React.Fragment,
                {},
                React.createElement(Header, {
                    masterState: masterState
                }),
                React.createElement(Footer, {
                    masterState: masterState
                })
            );
        }

        function Header(props) {
            return ReactDOM.createPortal(
                React.createElement("h2", {}, props.masterState.headerText),
                document.getElementById("header")
            );
        }

        function Footer(props) {
            return ReactDOM.createPortal(
                React.createElement("h2", {}, props.masterState.footerText),
                document.getElementById("footer")
            );
        }

        ReactDOM.render(React.createElement(Main), document.getElementById("root"));
    </script>
</body>
```

This renders:

```html
<body>
    <div id="root"></div>
    <header id="header"><h2>This is the header</h2></header>
    <main>This is a static body</main>
    <footer id="footer"><h2>This is the footer</h2></footer>
</body>
```
