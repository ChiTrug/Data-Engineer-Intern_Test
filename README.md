**1. SQL**

   The solution is contained in the file SQL_BankTimo.sql, and the file Bank_Data_Model_Physical_Export_create.sql has been executed on PostgresSQL.

**2.1 Source Code Structure and Integration Strategy:**




Data Extraction:

Utilize the API to extract relevant data, such as orders, customers, products, etc.
Implement pagination if the dataset is extensive.
Data Transformation:

Cleanse and transform the raw data into a format suitable for your data warehouse schema.
Handle data types, null values, and any necessary translations.
Incremental Updates:

Implement a mechanism to track and fetch only the new or modified records since the last extraction to minimize data transfer.
Error Handling:

Develop robust error-handling mechanisms to manage API rate limits, network issues, and potential API changes.
Data Loading:

Load the transformed data into the centralized data warehouse.

Monitoring and Logging:

Implement logging to track the ETL process and monitor for any anomalies.
Set up alerts for potential failures or irregularities.

**2.2 Database Schema Design for Data Warehouse:**

FIle Bank_Data_Model_Physical_Export-2024-01-04_15-18.png

![Bank_Data_Model_Physical_Export-2024-01-04_15-18](https://github.com/ChiTrug/Data-Engineer-Intern_Test/assets/125122891/6453843c-3461-4994-bf93-c94f1bb5674c)

   Explanation:
   
    -The schema is designed to maintain relationships between entities using foreign keys, facilitating easy navigation and joining of tables for data integration.
    
    -This schema allows for efficient reporting on customer behavior, order details, product performance, and financial transactions.
    
    -The schema is normalized to reduce data redundancy, ensuring efficient storage and minimizing update anomalies.
    
    -Proper indexing, partitioning, and optimization strategies can be applied based on the specific queries and reporting patterns to enhance performance.
    
The suggested schema aims to provide a foundation for a data warehouse that consolidates and integrates data from Haravan, allowing for effective reporting and analysis.
Adjustments can be made based on specific business requirements and data characteristics.
