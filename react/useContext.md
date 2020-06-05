# `useContext`

-   `const value = useContext(MyContext)`
-   Accepts a context object (the value returned from `React.createContext`) and returns the current context value for that context, which is determined by the `value` prop of the nearest `<MyContext.Provider>` above the calling component.
-   When the nearest provider above the component updates, this hook will trigger a rerender with the latest `value` passed to that provider. A rerender will happen even if an ancestor is memoized.

```js
const themes = {
    light: {
        foreground: "#000000",
        background: "#eeeeee",
    },
    dark: {
        foreground: "#ffffff",
        background: "#222222",
    },
};

const ThemeContext = React.createContext(themes.light);

function App() {
    return (
        <ThemeContext.Provider value={themes.dark}>
            <Toolbar />
        </ThemeContext.Provider>
    );
}

function Toolbar(props) {
    return (
        <div>
            <ThemedButton />
        </div>
    );
}

function ThemedButton() {
    const theme = useContext(ThemeContext);
    return (
        <button style={{ background: theme.background, color: theme.foreground }}>
            I am styled by theme context!
        </button>
    );
}
```
