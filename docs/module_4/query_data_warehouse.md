# Query a data warehouse

The Transact-SQL syntax used to query tables in a Synapse dedicated SQL pool is similar to SQL used in SQL Server or Azure SQL Database.

Most data analytics with a data warehouse involves aggregating numeric measures in fact tables by attributes in dimension tables. Because of the way a star or snowflake schema is implemented, queries to perform this kind of aggregation rely on **JOIN clauses** to connect fact tables to dimension tables, and a combination of **aggregate functions** and **GROUP BY clauses** to define the aggregation hierarchies.

Another common kind of analytical query is to partition the results based on a dimension attribute and rank the results within each partition. For example, you might want to rank stores each year by their sales revenue. To accomplish this goal, you can use Transact-SQL **ranking functions** such as ROW_NUMBER, RANK, DENSE_RANK, and NTILE. These functions enable you to partition the data over categories, each returning a specific value that indicates the relative position of each row within the partition.

The volume of data in a data warehouse can mean that even simple queries to count the number of records that meet specified criteria can take a considerable time to run. In many cases, a precise count isn't required, an approximate estimate will suffice. In such cases, you can use the **APPROX_COUNT_DISTINCT** that uses a HyperLogLog algorithm to retrieve an approximate count. The result is guaranteed to have a maximum error rate of 2% with 97% probability