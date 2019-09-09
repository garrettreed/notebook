# Characters and Encodings

## ASCII

-   Early format.
-   Characters were assigned a number between 32 and 127.
-   Computers used 8-bit bytes then, which had room for 2^8-1 or 255 numbers
-   128-255 wasn't enough to cover non-english characters.

## Unicode

-   Not an encoding or standard. Refers to the character set.
-   Attempt to create a single character set that could represent every character.
-   U+00639 (Unicode+hex)

## UTF-8

-   An encoding standard
-   Variable length
-   0-127 is stored as a single byte so it's backwards compatible with ASCII
-   128+ is stored using 2-6 bytes
-   2^48 possibilities

## UTF-16

-   2 bytes per character
-   Windows and Java use UTF-16
-   NOT backwards compatible with ASCII
