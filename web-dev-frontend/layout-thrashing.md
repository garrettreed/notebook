# Layout Thrashing

Sources:

-   https://developers.google.com/web/fundamentals/performance/rendering/avoid-large-complex-layouts-and-layout-thrashing
-   https://csstriggers.com/

Layout (Chrome, Opera, Safari, IE) is the same as Reflow (Firefox)

Execution order in shipping a frame to screen:

1. JS
2. Style
3. Layout
4. Paint
5. Composite

It is possible to force a layout earlier with javascript though a forced synchronous layout. This is using javascript to manipulate elements.

Example of layout thrashing (doing lots of sync laouts in quick succession)

```js
function resizeAllParagraphsToMatchBlockWidth() {
    // Puts the browser into a read-write-read-write cycle.
    for (var i = 0; i < paragraphs.length; i++) {
        paragraphs[i].style.width = box.offsetWidth + "px";
    }
}
```
