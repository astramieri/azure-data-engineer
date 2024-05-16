## Load dimension tables

One of the simplest ways to load data into a new dimension table is to use a **CREATE TABLE AS (CTAS) expression**. This statement creates a new table based on the results of a SELECT statement.

**NOTE**. You can't use IDENTITY to generate a unique integer value for the surrogate key when using a CTAS statement, so this example uses the ROW_NUMBER function to generate an incrementing row number for each row in the results ordered by the ProductID business key in the staged data.

    CREATE TABLE dbo.DimProduct
    WITH
    (
        DISTRIBUTION = REPLICATE,
        CLUSTERED COLUMNSTORE INDEX
    )
    AS
    SELECT 
        ROW_NUMBER() OVER(ORDER BY ProdID) AS ProdKey,
        ProdID as ProdAltKey,
        ProductName,
        ProductCategory,
        Color,
        Size,
        ListPrice,
        Discontinued
    FROM dbo.StageProduct;

When you need to load staged data into an existing dimension table, you can use an **INSERT statement**. This approach works if the staged data contains only records for new dimension entities (not updates to existing entities).

**NOTE**. Assuming the DimCustomer dimension table is defined with an IDENTITY CustomerKey column for the surrogate key (as described in the previous unit), the key will be generated automatically and the remaining columns will be populated using the values retrieved from the staging table by the SELECT query.

    INSERT INTO dbo.DimCustomer
    SELECT 
        CustomerNo AS CustAltKey,
        CustomerName,
        EmailAddress,
        Phone,
        StreetAddress,
        City,
        PostalCode,
        CountryRegion
    FROM dbo.StageCustomers