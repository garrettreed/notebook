# JavaScript Event Stopping

```html
<div id="foo">
    <button id="but" />
</div>

$("#foo").click(function() { // mouse click on div }); $("#but").click(function(ev) { // mouse click
on button ev.stopPropagation(); });
```

With `stopPropagation` only the button's click handler is called and the divs click handler never fires.

If you just `preventDefault` only the browser's default action is stopped but the div's click handler still fires.
