# How Azure Synapse Analytics works

Azure Synapse Analytics combines a centralized service for data storage and processing with an extensible architecture through which **linked services** enable you to integrate commonly used data stores, processing platforms, and visualization tools.

## Azure Synapse Analytics workspace

A **Synapse Analytics workspace** defines an instance of the Synapse Analytics service in which you can manage the services and data resources needed for your analytics solution. 

After creating a Synapse Analytics workspace, you can manage the services in it and perform data analytics tasks with them by using **Synapse Studio**, a web-based portal for Azure Synapse Analytics.

A Synapse Analytics workspace requires:
- a Resource Group for resources you explicitly create
- a Resource Group for managed resources used by the service
- a Data Lake Storage Account in which to store data, scripts, and other artifacts

## Ingesting and transforming data with pipelines

Azure Synapse Analytics includes built-in support for creating, running, and managing **pipelines** that orchestrate the activities necessary to retrieve data from a range of sources, transform the data as required, and load the resulting transformed data into an analytical store. 

Pipelines in Azure Synapse Analytics are based on the same underlying technology as **Azure Data Factory**.

## Querying and manipulating data with SQL

Azure Synapse Analytics supports SQL-based data querying and manipulation through two kinds of **SQL pool** that are based on the SQL Server relational database engine:
- **built-in serverless SQL pool** optimized for quering file-based data in a data lake
- **custom dedicated SQL pools** that host relational data warehouses

The Azure Synapse SQL system uses a **distributed query processing model** to parallelize SQL operations, resulting in a highly scalable solution for relational data processing. 

You can use the built-in serverless pool for cost-effective analysis and processing of file data in the data lake, and use dedicated SQL pools to create relational data warehouses for enterprise data modeling and reporting.

## Processing and analyzing data with Apache Spark

Apache Spark is an open source platform for big data analytics. Spark performs distributed processing of files in a data lake by running jobs that can be implemented using any of a range of supported programming languages.

In Azure Synapse Analytics, you can create one or more **Spark pools** and use interactive notebooks to combine code and notes as you build solutions for data analytics, machine learning, and data visualization.

## Exploring data with Data Explorer

**Azure Synapse Data Explorer** is a data processing engine in Azure Synapse Analytics that is based on the Azure Data Explorer service. 

Data Explorer uses an intuitive query syntax named **Kusto Query Language (KQL)** to enable high performance, low-latency analysis of batch and streaming data.

## Integrating with other Azure data services

Azure Synapse Analytics can be integrated with other Azure data services for end-to-end analytics solutions. 

Integrated solutions include:
- **Azure Synapse Link** enables near-realtime synchronization between operational data in Azure Cosmos DB, Azure SQL Database, SQL Server, and Microsoft Power Platform Dataverse and analytical data storage that can be queried in Azure Synapse Analytics
- **Microsoft Power BI** integration enables data analysts to integrate a Power BI workspace into a Synapse workspace, and perform interactive data visualization in Azure Synapse Studio
- **Microsoft Purview** integration enables organizations to catalog data assets in Azure Synapse Analytics, and makes it easier for data engineers to find data assets and track data lineage when implementing data pipelines that ingest data into Azure Synapse Analytics
- **Azure Machine Learning** integration enables data analysts and data scientists to integrate predictive model training and consumption into analytical solutions
