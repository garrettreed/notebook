# Load Testing

Really good resource: https://kalamuna.atlassian.net/wiki/spaces/KALA/pages/16023587/Testing+With+Apache+Benchmark+and+Siege

## Glossary

-   Latency: Also "response time". Measured in milliseconds (ms). Measured from the client, how long it takes to receive response from server.
-   Throughput: How many requests server can receive in a time perios, typically reuests per second.
-   Percentiles: Grouping results by their percentage in the sample set. If 50th percentile is 100ms, 50% of the requests were returned in 100ms or less.

## Basics

-   Web server latency is typically around 50-200 ms

## Plan

### Monitoring Resources

-   `watch free -h` to check available memory. `watch` defaults to every 2 seconds.
-   `top` or `htop` to monitor cpu idle, which is how much is free. Easier than figuring out sum of processes.

### Max Response Rate

-   Gonna use Apache Benchmark `ab` for testing a single url
-   Concurrency is how many parallel connections are made to the server. 100 is a safe default, but check `MaxClients` or `MaxThreads` setting to deremine how many it can handle. `nginx -T` for default nginx settings
-   `ab -n 1000 -c 100 http://example.com/`
-   Performance is likely to be low because of the bombardment.

### Max practical throughput

-   Need to back off concurrency to test the server's performance at varying levels of throughput.
-   `wrk2` allows specifying an exact number of requests per second.
-   Take max request rate from before and cut in half.
-   `wrk -t4 -c100 -d30s -R100 --latency http://example.com/`:
    -   `-t4`: Use for threads. This should equal the number of processor cores on your testing machine.
    -   `-d30s`: Run test for 30 seconds
    -   `-R100`: Specify exactly 100 requests per second
    -   `--latency`: Request detailed latency output
