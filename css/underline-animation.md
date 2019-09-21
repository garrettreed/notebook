# Animated underline hover effect

```css
a {
    text-decoration: none;
    color: red;
    background: linear-gradient(red 100%, red 0);
    background-size: 0 2px;
    background-repeat: no-repeat;
    background-position: center 85%;
    transition: color 0.3s ease-in-out, background 0.3s linear;
    padding-bottom: 2px;
}

a:hover {
    color: black;
    background-size: 100% 2px;
}
```
