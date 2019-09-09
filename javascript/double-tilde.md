# `~~` bit trick

`~~x` is the same as

```js
function(x) {
  if (x < 0) {
    return Math.ceil(x);
  }
  return Math.floor(x);
}
```

It removes everything after the decimal point because the bitwise operators implicitly convert their operands to signed 32-bit integers

Works whether the operands are (floating-point) numbers or strings, and the result is a number.

Requires `x` is between -(2^31) and 2^(31 - 1). Otherwise, overflow will occur and the number will "wrap around".
