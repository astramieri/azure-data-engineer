# Data concepts

**Operational Data** is usually transactional data that is generated and stored by applications, often in a relational or non-relational database. 

**Analytical Data** is data that has been optimized for analysis and reporting, often in a data warehouse.

**Streaming Data** refers to perpetual sources of data that generate data values in real-time, often relating to specific events. Common sources of streaming data include internet-of-things (IoT) devices and social media feeds.

**Data Pipelines** are used to orchestrate activities that transfer and transform data. Pipelines are the primary way in which data engineers implement repeatable ETL solutions that can be triggered based on a schedule or in response to events.

**Data Lakes** are storage repositories that holds large amounts of data in native, raw formats. Data lake stores are optimized for scaling to massive volumes (terabytes or petabytes) of data. The data typically comes from multiple heterogeneous sources, and may be structured, semi-structured, or unstructured. The idea with a data lake is to store everything in its original, untransformed state. This approach differs from a traditional data warehouse, which transforms and processes the data at the time of ingestion.

**Data Warehouses** are centralized repositories of integrated data from one or more disparate sources. Data warehouses store current and historical data in relational tables that are organized into a schema that optimizes performance for analytical queries.

**Apache Spark** is a parallel processing framework that takes advantage of in-memory processing and a distributed file storage. It's a common open-source software (OSS) tool for big data scenarios.
