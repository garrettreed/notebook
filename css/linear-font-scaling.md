# Linear font scaling using `calc` and `vw`

1. Pick two example page widths where you know the font size, ideally the min and max for a breakpoint. For example, `10px` at `400px` and `14px` at `1440px`.
2. Calculate the slope between the two points. The widths are on the x-axis and the font sizes are on the y-axis: `(14 - 10) / (1440 / 400) = .003846154`. Multiply by `100vw` to get `.3846154vw`.
3. Plug in one of the coordinates to get the y-intercept: `10 = .003846154 * 400 + b`, so `b = 8.46154`.
4. Your font size is `calc(8.46154px + 0.3846154vw);`

```css
.body-text {
    font-size: 10px;
}
@media screen and (min-width: 400px) and (max-width: 1440px) {
    .body-text {
        font-size: calc(8.4615px + 0.38462vw);
    }
}
@media screen and (min-width: 1440px) {
    .body-text {
        font-size: 14px;
    }
}
```

## If `vw` is not supported, use `rem`

```js
function remCalibrate() {
    document.documentElement.style.fontSize = window.innerWidth / 100 + "px";
}
remCalibrate();
window.addEventListener("resize", remCalibrate, false);
```

Then use `rem` in place of `vw`

## `vw` font sizes break zoom accessibility

nuff said
