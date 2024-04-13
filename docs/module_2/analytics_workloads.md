# Use Azure Data Lake Storage Gen2 in data analytics workloads

Azure Data Lake Store Gen2 is an enabling technology for multiple data analytics use cases. 

## Big data processing and analytics

Big data scenarios usually refer to analytical workloads that involve massive **volumes** of data in a **variety** of formats that needs to be processed at a fast **velocity** (the so-called "three v's"). 

## Data warehousing

In a typical example of a data warehousing solution, data is extracted from operational data stores and transformed into structures more suitable for analytical workloads. Often, the data is staged in a data lake in order to facilitate distributed processing before being loaded into a relational data warehouse. 

In some cases, the data warehouse uses external tables to define a relational metadata layer over files in the data lake and create an hybrid **data lakehouse** architecture. The data warehouse can then support analytical queries for reporting and visualization.

## Real-time data analytics

Unlike traditional batch processing workloads, streaming data requires a solution that can capture and process a boundless stream of data events as they occur.

Streaming events are often captured in a **queue** for processing. From here, the data is processed, often to aggregate data over temporal windows. 

## Data science and machine learning

Data science involves the **statistical analysis** of large volumes of data, often using tools such as Apache Spark and scripting languages such as Python. 

Machine learning is a subarea of data science that deals with training **predictive models**. Model training requires huge amounts of data, and the ability to process that data efficiently.