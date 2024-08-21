# Redfin Data Analytics Pipeline

This pipeline is designed to streamline & automate the processed of extracting, transforming & visualizing real estate data.

It leverages the following services:

Amazon EC2: Hosts Apache Airflow for orchestrating the ETL processes.

AWS S3: Holds the data which is to be later used by Amazon EMR for data transformation.

Amazon EMR: Handles data transformation tasks & loads the transformed data back to S3 to be further consumed by Snowflake.

Snowflake: Leverages Snowpipe to auto-populate the transformed data from S3 to Snowflake Databases.

Power BI: Visualizes the Snowflake data for insightful reporting.


### Architecture

![download](https://github.com/user-attachments/assets/5dacb827-b8ae-4102-8963-e8e9aec8ee63)

### S3 Bucket

![image](https://github.com/user-attachments/assets/876e5fa7-c079-4a59-a1fb-e44bc800db72)


### Airflow DAG

![image](https://github.com/user-attachments/assets/dcd17e5c-4094-4abd-b65b-6442000453ad)


### Snowflake Database

![image](https://github.com/user-attachments/assets/ee451a49-9fe7-45ed-aa45-3573a60ed8e7)

### Power BI Dashboard

![image](https://github.com/user-attachments/assets/5e065d65-aeb0-48d6-95fa-0ab4125aeb99)

### Features

1. Scalable :- This pipeline processes over a 100,000 records every month
2. Efficient :- Ensures efficient data handling via automated ETL processes
3. Insightful :- Provides detailed and interactive visualizations for real estate market analysis
