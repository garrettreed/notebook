# Higher-Order Components

-   Guide about them here: https://reactjs.org/docs/higher-order-components.html
-   Just a component that wraps another, and used so multiple components can share the same behavior (composition)
-   Don't use a HOC to manipulate a component's prototype. Return a new component with the props/methods added. Keep things pure.

## Wrap the Display Name for Easy Debugging

To keep things clear in react devtools:

```js
function withSubscription(WrappedComponent) {
    class WithSubscription extends React.Component {
        /* ... */
    }
    WithSubscription.displayName = `WithSubscription(${getDisplayName(WrappedComponent)})`;
    return WithSubscription;
}

function getDisplayName(WrappedComponent) {
    return WrappedComponent.displayName || WrappedComponent.name || "Component";
}
```
