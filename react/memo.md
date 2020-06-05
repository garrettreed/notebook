# `React.memo`

```js
const MyComponent = React.memo(function MyComponent(props) {
    /* render using props */
});
```

-   A higher order component, similar to `React.PureComponent`, but for function components instead of classes.
-   To be used when a component renders the same result given the same props.
