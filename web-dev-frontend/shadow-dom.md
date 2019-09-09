# Shadow DOM

## Pre knowledge

-   Primary reason: encapsulation
-   I know it's used in web components
-   At this point there are lots of twitter arguments about the usefulness of WC and shadow dom to web developers, and how it's more useful to framwork designers. This is my investigation.
-   Allows hidden DOM trees to be attached to elements the regular DOM tree. I guess like the `video` element has other things going on than just text.

## Initial Notes

-   Terminology
    -   Shadow Host: The regular DOM node that the shadow tree is attached to
    -   Shadow tree: The DOM tree inside the shodow DOM
    -   Shadow boundary: The place where the shadow DOM ends and the regular DOM begins
    -   Shadow root: The root node of the shadow tree. Not the shadow host. THe shadow host points to the shadow root. It looks like this gets flattened/removed during render.
-   You can manipulate a shadow DOM the same are regular DOM. Even styles if you include a style element in the shadow tree.

## Basic Usage

```js
let shadow = elementRef.attachShadow({ mode: "open" });
let shadow = elementRef.attachShadow({ mode: "closed" });
```

-   An `open` shadow means you can access the shadow DOM from JS written on the main page context:

```js
let myShadowDom = myCustomElem.shadowRoot;
```

## Example with a Custom Element

```js
class PopUpInfo extends HTMLElement {
    constructor() {
        super();

        var shadow = this.attachShadow({ mode: "open" });

        // Create spans
        var wrapper = document.createElement("span");
        wrapper.setAttribute("class", "wrapper");
        var icon = document.createElement("span");
        icon.setAttribute("class", "icon");
        icon.setAttribute("tabindex", 0);
        var info = document.createElement("span");
        info.setAttribute("class", "info");

        // Take attribute content and put it inside the info span
        var text = this.getAttribute("text");
        info.textContent = text;

        // Insert icon
        var imgUrl;
        if (this.hasAttribute("img")) {
            imgUrl = this.getAttribute("img");
        } else {
            imgUrl = "img/default.png";
        }
        var img = document.createElement("img");
        img.src = imgUrl;
        icon.appendChild(img);

        // Create some CSS to apply to the shadow dom
        var style = document.createElement("style");

        style.textContent = `
        .wrapper {
            position: relative;
        }

        .info {
            font-size: 0.8rem;
            width: 200px;
            display: inline-block;
            border: 1px solid black;
            padding: 10px;
            background: white;
            border-radius: 10px;
            opacity: 0;
            transition: 0.6s all;
            position: absolute;
            bottom: 20px;
            left: 10px;
            z-index: 3;
        }

        img {
            width: 1.2rem;
        }

        .icon:hover + .info, .icon:focus + .info {
            opacity: 1;
        }`;

        // attach the created elements to the shadow dom
        shadow.appendChild(style);
        shadow.appendChild(wrapper);
        wrapper.appendChild(icon);
        wrapper.appendChild(info);
    }
}

// Define the new element
customElements.define("popup-info", PopUpInfo);
```

```html
<popup-info
    img="img/alt.png"
    text="Your card validation code (CVC) is an extra
        security feature — it is the last 3 or 4
        numbers on the back of your card."
></popup-info>
```
