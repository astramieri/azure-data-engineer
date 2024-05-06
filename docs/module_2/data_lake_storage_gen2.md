# Azure Data Lake Storage Gen2

A *data lake* is a repository of data that is stored in its natural format, usually as blobs or files. 

**Azure Data Lake Storage** is a comprehensive, massively scalable, secure, and cost-effective data lake solution for high performance analytics built into Azure.

Azure Data Lake Storage builds on **Azure Blob Storage** capabilities to optimize it specifically for analytics workloads. This integration enables analytics performance, the tiering and data lifecycle management capabilities of blob storage, and the high-availability, security, and durability capabilities of Azure Storage.

## Hadoop compatible access

A benefit of Azure Data Lake Storage is that you can treat the data as if it's stored in a **Hadoop Distributed File System (HDFS)**. With this feature, you can store the data in one place and access it through compute technologies including Azure Databricks, Azure HDInsight, and Azure Synapse Analytics without moving the data between environments. 

## Security

Azure Data Lake Storage supports access control lists (ACLs) and Portable Operating System Interface (POSIX) permissions that don't inherit the permissions of the parent directory. In fact, you can set permissions at a directory level or file level for the data stored within the data lake, providing a much more secure storage system.

## Performance

Azure Data Lake Storage organizes the stored data into a **hierarchy of directories and subdirectories**, much like a file system, for easier navigation. As a result, data processing requires less computational resources, reducing both the time and cost.

## Data redundancy

Azure Data Lake Storage takes advantage of the Azure Blob Storage replication models that provide data redundancy in a single data center with locally redundant storage (LRS) or to a secondary region by using the Geo-redundant storage (GRS) option.