# Data Warehousing

-   Usually synonymous with "big data"
-   Not in 3NF. Should be normalized into 2NF.
-   Causes data redundancy, but quicker and easier retrieval for reporting/decision making based on trends, not specific points.
-   ETL:
    -   Extract: Get the data
    -   Transformation: Make it useful
    -   Loading: Save it to the data warehouse
-   Data Marts
    -   Sub-sets of the data warehouse
    -   Specific to a department or question
    -   Keeps queries separate and prevents stepping on toes
    -   Reduces amount of data to be processed
