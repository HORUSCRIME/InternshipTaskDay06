# InternshipTaskDay06


**Online Sales Data Analysis**

This project analyzes online sales data to identify monthly revenue and order volume trends. The data, originally in CSV format, was loaded into a PostgreSQL database for analysis.

**Objective**
To analyze sales trends by calculating monthly total revenue and order volume, specifically for 2024.DatasetThe online_sales_data.csv dataset contains order dates, transaction IDs, and revenue figures.

**Tools Used**
PostgreSQL: Database for data storage and querying.
Python: For loading CSV data into PostgreSQL.
Pandas: For CSV handling.
SQLAlchemy: For database connection and data upload.


Data Loading into PostgreSQLThe online_sales_data.csv was loaded into the internshiptask06 table in PostgreSQL using the following Python script:

_import pandas as pd
from sqlalchemy import create_engine_

_df = pd.read_csv(r'online_sales_data.csv')
engine = create_engine('postgresql://postgres:HorusCrime@localhost:5432/Nthg')
df.to_sql('internshiptask06', engine, index=False, if_exists='replace')_

_print("CSV data successfully loaded into 'internshiptask06' table!")_

Task 6: Sales Trend AnalysisA SQL query was executed to analyze monthly sales trends for the year 2024.
**SQL Query**

_SELECT
    EXTRACT(YEAR FROM TO_DATE("Date", 'YYYY-MM-DD')) AS year,
    EXTRACT(MONTH FROM TO_DATE("Date", 'YYYY-MM-DD')) AS month,
    ROUND(SUM("Total Revenue")::numeric, 2) AS total_revenue,
    COUNT(DISTINCT "Transaction ID") AS total_orders
FROM
    internshiptask06
WHERE
    TO_DATE("Date", 'YYYY-MM-DD') BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY
    year, month
ORDER BY
    year, month;_

    
**Query Explanation**

This query extracts the year and month from the "Date" column, calculates the sum of "Total Revenue" and the count of distinct "Transaction ID"s (total orders), filters for 2024, and groups/orders the results by year and month.

**Outcome**

This task successfully demonstrated importing CSV data into PostgreSQL, using SQL aggregations to analyze time-based sales trends, and filtering data by date ranges.
