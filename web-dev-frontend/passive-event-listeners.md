# Passive Event Listeners

-   [Overview](https://github.com/WICG/EventListenerOptions/blob/gh-pages/explainer.md)
-   Passive event listeners are a new feature in the DOM spec that enable developers to opt-in to better scroll performance by eliminating the need for scrolling to block on touch and wheel event listeners
-   Smooth scrolling is important so browsers implemented threaded scrolling to keep it smooth even with expensive js running. This optimization is blocked by waiting for any `touchstart` and `touchmove` handlers, which could also prevent scrolling entirely by calling `preventDefault()`. The `passive` options lets developers decide if `preventDefault()` should be able to be called on the event. If not, set passive to `true`. Then the browser can detect if there are no cancellable `touch` or `wheel` handlers and can start scrolling immediately.
-   Can't cancel passive events
-   Chrome mobile activates passive on top level listeners by default, so it's a good idea to be explicit with your use of passive on all touch listeners if the support is there.

## Use

`addEventListener` api has changed expanded from:

`target.addEventListener(type, listener[, useCapture]);`

where `useCapture` is a boolean, and adds an alternate form with an options object:

`target.addEventListener(type, listener[, options]);`

-   `options` object
    -   `capture`: same as existing use-capture boolean
    -   `once`: boolean indicating if listener should be invoked at most once after being added. Listener will be automatically removed after.
    -   `passive`: boolean

## Cancellable events

There are scenarios where an author may intentionally want to consistently disable scrolling by cancelling all touch or wheel events. These include:

-   Panning and zooming a map
-   Full-page/full-screen games

In these cases, the current behavior (which prevents scrolling optimization) is perfectly adequate, since scrolling itself is being prevented consistently. `passive` is not needed here, though it's often still a good idea to apply a `touch-action: none` CSS rule to make your intention explicit (eg. supporting browsers with Pointer Events but not Touch Events).

## Feature Detection

```js
// Test via a getter in the options object to see if the passive property is accessed
var supportsPassive = false;
try {
    var opts = Object.defineProperty({}, "passive", {
        get: function() {
            supportsPassive = true;
        }
    });
    window.addEventListener("test", null, opts);
} catch (e) {}

// Use our detect's results. passive applied if supported, capture will be false either way.
elem.addEventListener("touchstart", fn, supportsPassive ? { passive: true } : false);
```
