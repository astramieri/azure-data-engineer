# Perform post load optimization

After loading new data into the data warehouse, it's a good idea to rebuild the table indexes and update statistics on commonly queried columns.

The following example rebuilds all indexes on the *DimProduct* table.

    ALTER INDEX ALL ON dbo.DimProduct REBUILD

The following example creates statistics on the ProductCategory column of the *DimProduct* table.

    CREATE STATISTICS productcategory_stats ON dbo.DimProduct(ProductCategory);