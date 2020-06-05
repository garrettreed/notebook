# AWS Glue

-   An ETL service (extract, transform, load), which is a tool for moving data from one storage location to another.
-   Normally we would need to have a lambda that does the transformation and loading on live data received some sort of event drivern system like dynamo streams or kinesis, or run on an interval with data pipeline. Would also need a migration step for existing data.
-   Glue has crawlers that will catalog existing data, but can also run on events. For example, you can use a lambda to trigger an ETL job as soon as new data becomes available in S3.
