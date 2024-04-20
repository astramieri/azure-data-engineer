# Create data warehouse tables

When designing a star schema model for small or medium sized datasets you can use your preferred database, such as Azure SQL. For larger data sets you may benefit from implementing your data warehouse in **Azure Synapse Analytics** instead of SQL Server.

To create a relational data warehouse in Azure Synapse Analytics, you must create a **dedicated SQL Pool**.

The simplest way to do this in an existing Azure Synapse Analytics workspace is to use the **Manage** page in Azure Synapse Studio.

When provisioning a dedicated SQL pool, you can specify the following configuration settings:
- a **unique name** for the dedicated SQL pool
- a **performance level** for the SQL pool which determines the cost per hour for the pool when it's running
- whether to start with an empty pool or restore an existing database from a backup
- the collation of the SQL pool, which determines sort order and string comparison rules for the database
    - NOTE: you can't change the collation after creation!

You can control its running state in the Manage page of Synapse Studio. When the pool is running, you can explore it on the Data page, and create SQL scripts to run in it.

**NOTE: pause the dedicated sql pool when not required to prevent unnecessary costs!**

## Tables in SQL Dedicated Pools

To create tables in the dedicated SQL pool, you use the **CREATE TABLE** (or sometimes the **CREATE EXTERNAL TABLE**) Transact-SQL statement. 

The specific options used in the statement depend on the type of table you're creating, which can include:
- Fact Tables
- Dimension Tables
- Staging Tables

Dedicated SQL pools in Synapse Analytics **do not support foreign key and unique constraints** as found in other relational database systems like SQL Server. 

While Synapse Analytics dedicated SQL pools support clustered indexes as found in SQL Server, **the default index type is clustered columnstore**. This index type offers a significant performance advantage when querying large quantities of data in a typical data warehouse schema and should be used where possible.

Azure Synapse Analytics **dedicated SQL pools use a massively parallel processing (MPP) architecture**, as opposed to the symmetric multiprocessing (SMP) architecture used in most OLTP database systems. In an MPP system, the data in a table is distributed for processing across a pool of nodes. 

Synapse Analytics supports the following kinds of distribution:
- **hash**: a deterministic hash value is calculated for the specified column and used to assign the row to a compute node
- **round-robin**: rows are distributed evenly across all compute nodes
- **replicated**: a copy of the table is stored on each compute node

## Dimension tables

When you create a dimension table, ensure that the table definition includes surrogate and alternate keys as well as columns for the attributes of the dimension that you want to use to group aggregations. It's often easiest to use an **IDENTITY column** to auto-generate an incrementing surrogate key.

You can create a specific **schema as a namespace** for your tables. **DBO** is the default schema.

If you intend to use a **snowflake schema** in which dimension tables are related to one another, you should include the key for the parent dimension in the definition of the child dimension table.

### Example (Snowflake)

    CREATE TABLE dbo.DimGeography
    (
        GeographyKey INT IDENTITY NOT NULL,
        GeographyAlternateKey NVARCHAR(10) NULL,
        StreetAddress NVARCHAR(100),
        City NVARCHAR(20),
        PostalCode NVARCHAR(10),
        CountryRegion NVARCHAR(20)
    )
    WITH
    (
        DISTRIBUTION = REPLICATE,
        CLUSTERED COLUMNSTORE INDEX
    );

    CREATE TABLE dbo.DimCustomer
    (
        CustomerKey INT IDENTITY NOT NULL,
        CustomerAlternateKey NVARCHAR(15) NULL,
        GeographyKey INT NULL,
        CustomerName NVARCHAR(80) NOT NULL,
        EmailAddress NVARCHAR(50) NULL,
        Phone NVARCHAR(25) NULL
    )
    WITH
    (
        DISTRIBUTION = REPLICATE,
        CLUSTERED COLUMNSTORE INDEX
    );

### Example 2 (Time Dimension)

    CREATE TABLE dbo.DimDate
    ( 
        DateKey INT NOT NULL,
        DateAltKey DATETIME NOT NULL,
        DayOfMonth INT NOT NULL,
        DayOfWeek INT NOT NULL,
        DayName NVARCHAR(15) NOT NULL,
        MonthOfYear INT NOT NULL,
        MonthName NVARCHAR(15) NOT NULL,
        CalendarQuarter INT  NOT NULL,
        CalendarYear INT NOT NULL,
        FiscalQuarter INT NOT NULL,
        FiscalYear INT NOT NULL
    )
    WITH
    (
        DISTRIBUTION = REPLICATE,
        CLUSTERED COLUMNSTORE INDEX
    );

## Fact tables

Fact tables include the keys for each dimension to which they're related, and the attributes and numeric measures for specific events or observations that you want to analyze.

### Example

    CREATE TABLE dbo.FactSales
    (
        OrderDateKey INT NOT NULL,
        CustomerKey INT NOT NULL,
        ProductKey INT NOT NULL,
        StoreKey INT NOT NULL,
        OrderNumber NVARCHAR(10) NOT NULL,
        OrderLineItem INT NOT NULL,
        OrderQuantity SMALLINT NOT NULL,
        UnitPrice DECIMAL NOT NULL,
        Discount DECIMAL NOT NULL,
        Tax DECIMAL NOT NULL,
        SalesAmount DECIMAL NOT NULL
    )
    WITH
    (
        DISTRIBUTION = HASH(OrderNumber),
        CLUSTERED COLUMNSTORE INDEX
    );

## Staging Tables

Staging tables are used as temporary storage for data as it's being loaded into the data warehouse. A typical pattern is to structure the table to make it as efficient as possible to ingest the data from its external source (often files in a data lake) into the relational database, and then use SQL statements to load the data from the staging tables into the dimension and fact tables.

## External Tables

In some cases, if the data to be loaded is in files with an appropriate structure, it can be more effective to create external tables that reference the file location. This way, the data can be read directly from the source files instead of being loaded into the relational store. 

### Example

    -- External data source links to data lake location
    CREATE EXTERNAL DATA SOURCE StagedFiles
    WITH (
        LOCATION = 'https://mydatalake.blob.core.windows.net/data/stagedfiles/'
    );
    GO

    -- External format specifies file format
    CREATE EXTERNAL FILE FORMAT ParquetFormat
    WITH (
        FORMAT_TYPE = PARQUET,
        DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
    );
    GO

    -- External table references files in external data source
    CREATE EXTERNAL TABLE dbo.ExternalStageProduct
    (
        ProductID NVARCHAR(10) NOT NULL,
        ProductName NVARCHAR(200) NOT NULL,
        ProductCategory NVARCHAR(200) NOT NULL,
        Color NVARCHAR(10),
        Size NVARCHAR(10),
        ListPrice DECIMAL NOT NULL,
        Discontinued BIT NOT NULL
    )
    WITH
    (
        DATA_SOURCE = StagedFiles,
        LOCATION = 'products/*.parquet',
        FILE_FORMAT = ParquetFormat
    );
    GO