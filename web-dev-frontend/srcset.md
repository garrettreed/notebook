# srcset

-   `srcset` attribute: defines the set of images we will allow the browser to choose between, and what size each image is. Before each comma:
    1. An image filename
    2. A space
    3. The image's inherent width in pixels (480w) OR the image's reesolution multiplier to match the [display pixel density ratio](http://dpi.lv/) (1.5x, 2x, 3x, etc).
-   `sizes` attribute: A set of media conditions. Before each comma:
    1. A CSS media condition
    2. A space
    3. The width of the slot the image will fill when the media condition is true.

## Notes

-   As you you increase the size of the browser, the larger images will be swapped in, but it doesn't work in reverse as you size down. The purpose is to save bandwidth. The behavior supports that.
-   The `sizes` attribute is optional, but recommended. If left out, the browser picks the image for displaying in a width of 100vw. CSS values or container sizes are not considered. An image being displayed in a 400px container may use the largest size in the `srcset` if it fits the browser width.
-   The image placed is dependant on the slot. A 400px image will not be placed in a 300px slot. It will use the size below. The mapping of srcs to sizes is not 1:1. It's best to just leave out `sizes` if you don't have predetermined slots.
-   The final size is optional if it's the largest and is preceded by a max-width media query.
-   If the width of the slot is left out, the size will be ignored.
-   If one of the larger images in the srcset is loaded elsewhere on the page, it will cause the srcset to skip any of the smaller images.
-   `src` will only be used as a backup in unsupported browsers.
-   `sizes` is not neded if you're switching based on display resolution.

<!-- prettier-ignore -->
```html
<img srcset="./c.jpeg 300w,
             ./b.jpeg 400w,
             ./a.jpeg 500w"
      sizes="(max-width: 350px) 250px,
             (max-width: 450px) 350px,
             450px"
      src="c.jpg" alt="a picture">
```
