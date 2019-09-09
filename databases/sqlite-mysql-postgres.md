# SQLite vs MySQL vs PostgreSQL

A comparison of relational database management systems

## SQLite

-   Embedded inside the application that makes use of it

### Data Types

-   NULL: null value
-   INTEGER: Variable byte size
-   REAL: Floating point stored as 8 byte
-   TEXT: Text string stored using db encoding
-   BLOB: Blob of data stored exactly as input

### Advantages

-   File Based: stored as a single file. Very portable
-   Great for building and testing

### Disadvantages

-   No user management
-   No performance adjustments

### When to use

-   Embedded apps
-   Disk access replacement
-   Testing

### When not to use

-   Multi user apps
-   High write volumes - can only write one at a time

## MySQL

-   Fully Featured SQL

### Data Types

-   TINYINT, SMALLINT, MEDIUMINT, INT/INTEGER, BIGINT
-   FLOAT, DOUBLE/DOUBLE PRECISION/REAL, DECIMAL/NUMERIC
-   DATE, DATETIME, TIMESTAMP, TIME, YEAR
-   CHAR
-   VARCHAR
-   TINYBLOB, TINYTEXT
-   BLOB, TEXT
-   MEDIUMBLOB, MEDIUMTEXT
-   LONGBLOB, LONGTEXT
-   ENUM, SET
