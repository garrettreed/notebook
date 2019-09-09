# SQL Timestamps

## Add days

```sql
UPDATE table_name
  SET available_at = ADDDATE(available_at, INTERVAL 3 DAY)
  WHERE available_at between '2015-07-20 02:24:42' AND '2015-07-24 11:54:37'
```

## Convert text/CSV date to timestamp

-   In Sequel Pro import, use the custom sql statement.
-   Date formatting: http://www.w3schools.com/sql/func_date_format.asp

```sql
STR_TO_DATE(CONCAT($2, " ", $3), '%c/%e/%Y %h:%i:%s %p')
```
