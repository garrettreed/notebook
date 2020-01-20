# XML Misuse

-   XML is a markup language, not a data format.
-   The ordering of elements is significant.

## Examples of bad schema design:

```xml
<root>
  <item name="name" value="John" />
  <item name="city" value="London" />
</root>
```

This is an attempt at a hashmap. When you remove the attributes, it's meaningless.

```xml
<root>
  <item key="name">John</item>
  <item key="city">London</item>
</root>
```

Slight improvement

## Correct XML Dictionary

```xml
<root>
  <item>
    <key>Name</key>
    <value>John</value>
  </item>
  <item>
    <key>City</key>
    <value>London</value>
  </item>
</root>
```

But this is a data format. It's long winded, and un-suited for this. Pick a different way of representing the data (JSON).
