# Load data warehouse tables

One of the most common patterns for loading a data warehouse is:
1. transfer data from source systems to files in a data lake
2. ingest the file data into staging tables
3. use SQL statements to load the data from the staging tables into the dimension and fact tables. 

Usually data loading is performed as a periodic batch process in which inserts and updates to the data warehouse are coordinated to occur at a regular interval (for example, daily, weekly, or monthly).

## Data Warehouse Load Process

1. Ingest the new data to be loaded into a data lake, applying pre-load cleansing or transformations as required
2. Load the data from files into staging tables in the relational data warehouse
3. Load the dimension tables from the dimension data in the staging tables, updating existing rows or inserting new rows and generating surrogate key values as necessary
4. Load the fact tables from the fact data in the staging tables, looking up the appropriate surrogate keys for related dimensions
5. Perform post-load optimization by updating indexes and table distribution statistics