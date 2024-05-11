# Data flows in Azure Synapse Analytics

A Data Flow is a commonly used activity type to define data flow and transformation. 

Data flows consist of:
- **Sources**: the input data to be transferred
- **Transformations**: various operations that you can apply to data as it streams through the data flow
- **Sinks**: targets into which the data will be loaded

An important part of creating a data flow is to define mappings for the columns as the data flows through the various stages, ensuring column names and data types are defined appropriately. While developing a data flow, you can enable the Data flow debug option to pass a subset of data through the flow, which can be useful to test that your columns are mapped correctly.