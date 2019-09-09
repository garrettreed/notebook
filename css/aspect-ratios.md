# Maintain aspect ratios

1. Get the ratio by `height / width`. 16:9 is equal to `.5625`
2. Multiply by 100% (`56.25%`)
3. Set that value to a container's `padding-top`. Absolutely position children relative to the container.

```html
<style>
    .container {
        height: 0;
        padding-top: 56.25%;
        position: relative;
        border: 1px solid black;
    }
    .child {
        margin: 0;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
</style>
<div class="container">
    <p class="child">hello!</p>
</div>
```
