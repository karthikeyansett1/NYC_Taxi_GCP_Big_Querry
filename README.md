# NYC Taxi Trip Data: Big Data Pipeline and Visualization

This project explores and analyzes the 2019 New York City Yellow Taxi Trip dataset using modern cloud-based big data tools. It demonstrates an end-to-end pipeline involving data cleaning, distributed processing, SQL querying, and interactive visualization.

Project Overview

- **Objective**: Discover patterns in NYC taxi activity — trip volumes, distance trends, zone-wise pickup behavior, and seasonal changes — through big data analytics.
- **Tools Used**:
  - Google BigQuery for querying the raw dataset
  - Google Cloud Storage (GCS) for storage
  - Google Cloud Dataproc (PySpark) for distributed processing
  - Looker Studio for visualization
- **Dataset**: [NYC Yellow Taxi Trips 2019](https://console.cloud.google.com/marketplace/product/bigquery-public-data/new_york_taxi_trips)

Key Insights

- Identified top 10 pickup zones in NYC by ride count
- Analyzed trip frequency across all 12 months of 2019
- Explored the relationship between tip amounts and trip distances
- Created an interactive Looker Studio dashboard with zone-wise and time-based filters

Project Structure

├── spark_script.py # PySpark script used on Dataproc
├── SQL_queries/ # SQL queries used in BigQuery
│ └── zone_summary.sql
├── looker_dashboard/ # Looker screenshots (PNG/JPEG)
├── Karthikeyan_Setti_NYC_Taxi_Project_Report.pdf
├── README.md
└── .gitignore


How to Reproduce


Use the provided SQL scripts in your BigQuery console to extract and explore taxi data.

Use the spark_script.py file on a GCP Dataproc cluster to perform distributed processing. Make sure to adjust bucket paths as needed.

View or recreate the Looker Studio dashboard using the sample screenshots or connect it directly to your BigQuery table.

Report
You can find the full write-up with methodology, visuals, and discussion in:

Karthikeyan_Setti_NYC_Taxi_Project_Report.pdf

Credits
Dataset provided by NYC TLC, hosted on Google BigQuery public datasets

Project completed as part of INFO-I535: Big Data Concepts and Implementations, Indiana University Bloomington



