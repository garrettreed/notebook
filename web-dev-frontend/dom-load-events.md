# DOM Load Events

## `load`

```js
window.addEventListener("load", function() {
    // Handler when all assets (including images) are loaded
});
```

Not usually a great idea unless you need to know final element sizes to run your function:

## `DOMContentLoaded`

```js
document.addEventListener("DOMContentLoaded", function() {
    // Handler when the DOM is fully loaded
});
```

IE9+
Function will not be executed if the event has already fired.

## jQuery's `ready`

Pretty much the same as `DOMContentLoaded`, but also adds a `readyState` check to make sure the callback gets called.

```js
function domReady(callback) {
    if (
        document.readyState === "complete" ||
        (document.readyState !== "loading" && !document.documentElement.doScroll)
    ) {
        callback();
    } else {
        document.addEventListener("DOMContentLoaded", callback);
    }
}
```
