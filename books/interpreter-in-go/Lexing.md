# Lexing

-   Lexing(Source Code -> Tokens) -> AST
-   Lexers are also called tokenizers or scanners
-   Prod-ready lexers might include line num, col num, and filename for debugging

```txt
"let x = 5 + 5;"
[
    LET,
    IDENTIFIER("x"),
    EQUAL_SIGN,
    INTEGER(5),
    PLUS_SIGN,
    INTEGER(5),
    SEMICOLON
]
```
