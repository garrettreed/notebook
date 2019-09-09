# General Database Notes

## CAP Theorem and clustering

-   A networked shared-data system can have at most 2 of the 3
    1. Consistency: more accurately, linearizability, any point every node sees the same data and is up to date. All the servers in the system will have the same data. Don't respond if data could be old.
    2. Availability: every request is notified by every node. The system will always respond to a request, even if it's not the latest data or consistent across all servers
    3. Partition Tolerance: system functions irrespective of network partitioning
-   Loosely classifies databases into 3 categories
    1. CA: Impossible. A single networked client partitions the system
    2. CP: in the presence of a partition will only serve consistent data
    3. AP: in the presence of a partition will continue responding but will make no guarantee of Consistency
-   Partition tolerance is not optional when it comes to databases
-   MySQL isn't built for running in a cluster. It runs on one server. No partition tolerance.
    -   Master-slave is possible as AP, only allowing writes to master with reads possible from slaves. Sacrafices consistency for availability (no guarantee of latest data)
    -   Galera Cluster does synchronous replication on top of InnoDB. All nodes must see each other to be members. If split in two, the majority will respond while minority will reject. CP.

## Transactions

-   A single unit of work against the database
-   ACID Transactions
    -   Atomic: everything in the transaction is part of a single atom, so everything succeeds or fails
    -   Consistent: start and end of transaction are valid and do not violate any database rules
    -   Isolated: transactions cannot interfere with each other
    -   Durable: all completed transactions persist

## Linearizability

-   The real meaning of C in CAP
-   Once transaction is complete, all later transactions should see that reflected

## Normalization

-   Informally, a Database is considered normalized if it's in the third normal form 3NF
-   It's not always necessary to enforce 3NF. Sometimes 2NF is fine.

### 1NF

-   The information is stored in a relational table with primary key.
-   Each column contains only atomic values.
-   No repeating groups of columns.
-   Atomic value: Value that cannot be divided

```
Fails 1NF atomic:
Employees
employee_id   name  	  sales_office  office_number   clients
1  	          Jon Doe   New York      888-888-8888    Ford, GE

Fails 1NF repeating columns:
Employees
employee_id   name  	  sales_office  office_number   client_1    client_2
1  	          Jon Doe   New York      888-888-8888    Ford        GE

Fixed
Employees
employee_id   name      sales_office  office_number
1  	          Jon Doe   New York      888-888-8888

Clients
client_id   name    city      employee_id
1           GE      Chicago   1
2           Ford    Detroit   1
```

### 2NF

-   In 1NF
-   All the columns depend on table's primary key.
-   Intersection table: table with just keys. Used for many-to-many relationships

```
Fixed
Employees
employee_id   name      office_id
1  	          Jon Doe   1

Clients
client_id   name    city      postal_code
1           GE      Chicago   60007
2           Ford    Detroit   48127

SalesClient
employee_id   client_id
1             1
1             2

Offices
office_id   city      phone
1           New York  888-888-8888
```

### 3NF

-   Contains only columns that are non-transitively dependent on the primary key
-   Transitive: 10 > 5 and 5 > 3 so 10 > 3.
-   In our example, customer's city depends on postal code for accuracy

```
Employees
employee_id   name      office_id
1  	          Jon Doe   1

Clients
client_id   name    postal_code
1           GE      60007
2           Ford    48127

SalesClient
employee_id   client_id
1             1
1             2

Offices
office_id   city      phone
1           New York  888-888-8888

PostalCodes
postal_code   city
60007         Chicago
48127         Detroit
```

## Relational Databases (RDBMS)

-   Focus on relations between data
-   Stores data in tables of rows and columns

## Document Databases

-   Stores semi-structured data
-   Data has no clear separation between the data's schema and the data itself

## Indexing

-   Keep track of a particular column or attribute
-   Makes reads faster but writes slower
