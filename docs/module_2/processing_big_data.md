# Understand the stages for processing big data

Data Lakes have a fundamental role in a wide range of big data architectures. These architectures can involve the creation of:
- an enterprise data warehouse
- advanced analytics against big data
- a real-time analytical solution

There are **four stages for processing big data** solutions that are common to all architectures:
1. **Ingest**
2. **Store**
3. **Prep and train**
4. **Model and serve**

## Ingest phase

The ingestion phase identifies the technology and processes that are used to acquire the source data. This data can come from files, logs, and other types of unstructured data that must be put into the data lake. 

The technology that is used will vary depending on the frequency that the data is transferred. For example, for batch movement of data, pipelines in Azure Synapse Analytics or Azure Data Factory may be the most appropriate technology to use. For real-time ingestion of data, Apache Kafka for HDInsight or Stream Analytics may be an appropriate choice.

## Store phase

The store phase identifies where the ingested data should be placed. 

Azure Data Lake Storage Gen2 provides a secure and scalable storage solution that is compatible with commonly used big data processing technologies.

## Prep and train

The prep and train phase identifies the technologies that are used to perform data preparation and model training and scoring for machine learning solutions. 

Common technologies that are used in this phase are Azure Synapse Analytics, Azure Databricks, Azure HDInsight, and Azure Machine Learning.

## Model and serve

Finally, the model and serve phase involves the technologies that will present the data to users. 

These technologies can include visualization tools such as Microsoft Power BI, or analytical data stores such as Azure Synapse Analytics. Often, a combination of multiple technologies will be used depending on the business requirements.
