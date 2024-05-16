# Load staging tables

One of the most common patterns for loading a data warehouse is to transfer data from source systems to files in a data lake, ingest the file data into staging tables, and then use SQL statements to load the data from the staging tables into the dimension and fact tables. 

Usually data loading is performed as a periodic batch process in which inserts and updates to the data warehouse are coordinated to occur at a regular interval (for example, daily, weekly, or monthly).

The following code example creates a staging table for product data that will ultimately be loaded into a dimension table.

    CREATE TABLE dbo.StageProduct
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
        DISTRIBUTION = ROUND_ROBIN,
        CLUSTERED COLUMNSTORE INDEX
    );

You can use the COPY statement to load data from the data lake, as shown in the following example.

    COPY INTO dbo.StageProduct
    (
        ProductID,
        ProductName,
        ProductCategory,
        Color,
        Size,
        ListPrice,
        Discontinued
    )
    FROM 'https://mydatalake.../data/products*.parquet'
    WITH
    (
        FILE_TYPE = 'PARQUET',
        MAXERRORS = 0,
        IDENTITY_INSERT = 'OFF'
    );

## Using external tables

In some cases, if the data to be loaded is stored in files with an appropriate structure, it can be more effective to create external tables that reference the file location. This way, the data can be read directly from the source files instead of being loaded into the relational store. 

The following example, shows how to create an external table that references files in the data lake associated with the Azure Synapse Analytics workspace.

    CREATE EXTERNAL TABLE dbo.ExternalStageProduct
    (
        ProductID NVARCHAR(10) NOT NULL,
        ProductName NVARCHAR(200) NOT NULL,
        ProductCategory NVARCHAR(200) NOT NULL,
        Color NVARCHAR(10),
        Size NVARCHAR(10),
        ListPrice DECIMAL NOT NULL,
        Discontinued BIT NOT NULL
    ...
    )
    WITH
    (
        DATE_SOURCE = StagedFiles,
        LOCATION = 'folder_name/*.parquet',
        FILE_FORMAT = ParquetFormat
    );
    GO