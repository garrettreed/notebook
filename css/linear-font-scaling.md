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

Here’s one way to think about it (and forgive any sloppy use of math terms, I’m v out of practice): picture a normal X-Y graph, the X axis representing the width of the window, the Y axis representing the font size. So plot the path of our font size: the line runs from (0, 10) to (400, 10), then slopes up from there to (1440, 14), then runs flat out from there along (n, 14).
So the problem becomes how to find the slope (which will be in VWs) and, since the slope of VWs always run linearly from the origin, how to adjust that slope to fit out bounds. Here’s a procedure:

0. What are the desired widths and font sizes, as cartesian coordinates?
   (400, 10), (1440, 14)
1. Translate that line segment to the origin.
   (0, 0), (1040, 4)
1. Get the slope of the line.
   (4px \* 100vw) / 1040px = 0.38462vw
1. Get the value of that slope at the upper bound.
   (0.38462vw \* 1440px) / 100vw = 5.5385px
1. Get difference between that value and the upper bound’s desired font size.
   14px - 5.5385px = 8.4615px
   Here’s this procedure in JS:
   function vwBetweenBounds(lower, upper) {
   let trans = [
   (upper[0] - lower[0]),
   (upper[1] - lower[1])
   ];
   let slope = ((trans[1] _ 100) / trans[0]);
   let base_val = ((slope _ upper[0]) / 100);
   let adj_val = (upper[1] - adj);
   return {
   slope: slope,
   adj: adj_val,
   };
   }
   vwBetweenBounds([400, 10], [1440, 14]); // { slope: 0.38461538461538464, adj: 8.46153846153846 }
   vwBetweenBounds([600, 12], [1200, 18]); // { slope: 1, adj: 6 }
   So then, in the CSS, we can specify:
   .ramkat-text {
   font-size: 10px;
   }
   @media screen and (min-width: 400px) and (max-width: 1440px) {
   .ramkat-text {
   font-size: calc(8.4615px + 0.38462vw);
   }
   }
   @media screen and (min-width: 1440px) {
   .ramkat-text {
   font-size: 14px;
   }
   }
   Which eliminates the need to use JS to adjust the font size.
