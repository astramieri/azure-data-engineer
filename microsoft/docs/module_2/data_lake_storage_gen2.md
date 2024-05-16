# Azure Data Lake Storage Gen2

A *data lake* is a repository of data that is stored in its natural format, usually as blobs or files. 

**Azure Data Lake Storage** is a comprehensive, massively scalable, secure, and cost-effective data lake solution for high performance analytics built into Azure.

Azure Data Lake Storage builds on **Azure Blob Storage** capabilities to optimize it specifically for analytics workloads. This integration enables analytics performance, the tiering and data lifecycle management capabilities of blob storage, and the high-availability, security, and durability capabilities of Azure Storage.

Azure Data Lake Storage Gen2 is not a standalone Azure service, but rather a configurable capability of a **Storage V2** (General Purpose V2) Azure Storage.

To enable Azure Data Lake Storage Gen2 in an **Azure Storage account**, you can select the option to **Enable hierarchical namespace** in the **Advanced** page when creating the storage account in the Azure portal Alternatively, if you already have an Azure Storage account and want to enable the Azure data Lake Storage Gen2 capability, you can use the **Data Lake Gen2 upgrade wizard** in the Azure portal page for your storage account resource.

## Azure Data Lake Store vs Azure Blob Storage

In **Azure Blob Storage**, you can store large amounts of unstructured data ("object") in a flat namespace within a blob container. Blob names can include "/" characters to organize blobs into virtual "folders", but in terms of blob manageability the blobs are stored as a single-level hierarchy in a flat namespace.

**Azure Data Lake Storage Gen2** builds on Azure Blob Storage and optimizes I/O of high-volume data by using a hierarchical namespace that organizes blob data into **directories**, and stores metadata about each directory and the files within it. This structure allows operations, such as directory renames and deletes, to be performed in a single atomic operation. Flat namespaces, by contrast, require several operations proportionate to the number of objects in the structure. Hierarchical namespaces keep the data organized, which yields better storage and retrieval performance for an analytical use case and lowers the cost of analysis.

## Azure Data Lake Storage Benefits

### Hadoop compatible access

A benefit of Azure Data Lake Storage is that you can treat the data as if it's stored in a **Hadoop Distributed File System (HDFS)**. With this feature, you can store the data in one place and access it through compute technologies including Azure Databricks, Azure HDInsight, and Azure Synapse Analytics without moving the data between environments. 

### Security

Azure Data Lake Storage supports access control lists (ACLs) and Portable Operating System Interface (POSIX) permissions that don't inherit the permissions of the parent directory. In fact, you can set permissions at a directory level or file level for the data stored within the data lake, providing a much more secure storage system.

### Performance

Azure Data Lake Storage organizes the stored data into a **hierarchy of directories and subdirectories**, much like a file system, for easier navigation. As a result, data processing requires less computational resources, reducing both the time and cost.

### Data redundancy

Azure Data Lake Storage takes advantage of the Azure Blob Storage replication models that provide data redundancy in a single data center with locally redundant storage (LRS) or to a secondary region by using the Geo-redundant storage (GRS) option.