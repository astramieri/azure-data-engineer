# Pipelines in Azure Synapse Analytics

Pipelines in Azure Synapse Analytics encapsulate a sequence of activities that perform data movement and processing tasks. 

You can use a pipeline to define data transfer and transformation activities, and orchestrate these activities through control flow activities that manage branching, looping, and other typical processing logic. 

Core pipeline concepts:
- **Activities**
    - They are the **executable tasks** in a pipeline
    - You can define a flow of activities by connecting them in a sequence
    - The outcome of a particular activity (success, failure, or completion) can be used to direct the flow to the next activity in the sequence
- **Integration runtime**
    - It provides compute resources and an execution context
    - It is used to initiate and coordinate the activities in the pipeline
- **Linked services**
    - They enable secure connections to the external services 
    - They are defined at *workspace level* and can be shared across multiple pipelines
- **Datasets**
    - They define the schemas for each data object that will be used in the pipeline
    - They have an associated linked service to connect to its source Activities can have datasets as inputs or outputs
    - They are defined at *workspace level* and can be shared across multiple pipelines

![Azure Pipeline](./pipeline.png)