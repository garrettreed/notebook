# Linear Interpolation in UI Animation

```js
function lerp(min, max, fraction) {
    return (max - min) * fraction + min;
}
```

-   Linear Inetpolation, or LERP is the simplest function for generating in-betweens (tweens) between a scene's keyframes.
-   Think about trying to move an object from one point to another. It's easy if you can add 1px to the coordinates until it gets there. Without math involving curves and trig, it would just move along at an angle until either going vertical or horizontal to arrive at the location - not natural at all.
-   lerp takes a min value, max value, and a fraction (value between 0 and 1). It uses the fraction to generate a value between min and max.
-   A fraction value closer to 1 will produce a result closer to the max value, where a fraction value closer to 0 will produce a value closer to the min value. It also affects the speed of the animation. A smaller value results in more calcuations to get to the target, so it is slower.
-   Can be a bit unnatural, so more complex interpolation functions are typically used. Wikipedia says piecewise polynomial interpolation.

## Example with JS and Canvas

```js
const canvas = document.getElementById("canvas"),
    context = canvas.getContext("2d"),
    width = (canvas.width = window.innerWidth),
    height = (canvas.height = window.innerHeight);

// Point A
const startX = 50,
    startY = 50;

// Point B
let endX = 420,
    endY = 200;

// Current position of the ball
let x = startX,
    y = startY;

update();
function update() {
    context.clearRect(0, 0, width, height);
    drawBall(x, y, 30);
    x = lerp(x, endX, 0.1);
    y = lerp(y, endY, 0.1);
    requestAnimationFrame(update);
}

function drawBall(x, y, radius) {
    context.beginPath();
    context.fillStyle = "#66DA79";
    context.arc(x, y, radius, 0, 2 * Math.PI, false);
    context.fill();
}

function lerp(min, max, fraction) {
    return (max - min) * fraction + min;
}

window.addEventListener("mousemove", e => {
    endX = e.x;
    endY = e.y;
});
```
