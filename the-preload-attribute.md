<!-- TITLE: The Preload Attribute -->

# Preload (HTML)

- `<link rel=“preload”>`
- Not very well supported yet
- Doesn't block the window's `onload` event unless the resource is also requested by a resource that blocks the event.
- `as` attribute allows:
  - Setting the right resource priority
  - Make sure the request is subject to the right Content-Security-Policy directives and doesn't send to the server if not
  - The browser to set the appropriate `Accept` headers based on resource type
- Possible `as` values
  - script
  - style
  - image
  - media
  - document
  - and others: https://fetch.spec.whatwg.org/#concept-request-destination
- Omitting `as` attribute is the equivalent to an XHR request where browser doesn't know what it is fetching.

## Markup-based async loader

- `<link rel="preload" as="style" href="async_style.css" onload="this.rel='stylesheet'">`
- Same works for scripts
- Already have `<script async>`, but that blocks the window's `onload` event

```html
<link rel="preload" as="script" href="async_script.js"
onload="var script = document.createElement('script');
        script.src = this.href;
        document.body.appendChild(script);">
```

## Responsive loading

```html
<link rel="preload" as="image" href="map.png" media="(max-width: 600px)">

<link rel="preload" as="script" href="map.js" media="(min-width: 601px)">
```

## Other Notes

- `<link rel="preload" href="font.woff2" as="font" type="font/woff2" crossorigin>`
  - `crossorigin` attribute is required for all font requests because they're requested anonymously
  - `type` makes sure this resource will only get preloaded on browsers that support that file type.


## Differences from prefetch

- `<link rel=“prefetch”>`
- Good browser support
- Fetches a resource that will probably needed for next navigation.
- Speeds up next navigation instead of current one.

## Differences from subresource

- `<link rel="subresource">`
- Original plan for preload, but being replaced

## Differences from http 2 push

- There is some overlap, but they complement each other
- Push can send resources that the HTML hasn't requested yet
- The application is aware of the resources preloaded, not pushed.
- Push cannot be used for third party resources

## Feature detection

```js
var DOMTokenListSupports = function(tokenList, token) {
  if (!tokenList || !tokenList.supports) {
    return;
  }
  try {
    return tokenList.supports(token);
  } catch (e) {
    if (e instanceof TypeError) {
      console.log("The DOMTokenList doesn't have a supported tokens list");
    } else {
      console.error("That shouldn't have happened");
    }
  }
};

var linkSupportsPreload = DOMTokenListSupports(document.createElement("link").relList, "preload");
if (!linkSupportsPreload) {
  // Dynamically load the things that relied on preload.
}
```