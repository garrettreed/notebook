# Hindley-Milner Type Signatures

Used to document functions

```js
// takes a String and returns a String:
// capitalize :: String -> String
var capitalize = function(s) {
    return toUpperCase(head(s)) + toLowerCase(tail(s));
};

// strLength :: String -> Number
var strLength = function(s) {
    return s.length;
};

// join :: String -> [String] -> String
var join = curry(function(what, xs) {
    return xs.join(what);
});

// match :: Regex -> String -> [String]
var match = curry(function(reg, s) {
    return s.match(reg);
});

// replace :: Regex -> String -> String -> String
var replace = curry(function(reg, sub, s) {
    return s.replace(reg, sub);
});
```
