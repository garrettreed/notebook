# CSS Rule Order Specificity

If two declarations have the same weight, origin and specificity, the latter specified wins. Declarations in imported style sheets are considered to be before any declarations in the style sheet itself.

```html
<div class="red green"></div>
```

```css
.green {
    color: green;
}
.red {
    color: red;
}
```

`.red` wins here, it doesn't matter the order in the class attribute, all that matters is the order the styles are defined in the CSS itself.
