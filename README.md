# Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository! 
This project demonstrates a comprehensive data warehousing and analytics solution, from building a modern data warehouse to generating actionable business insights. Designed as a portfolio project, it highlights industry best practices in data engineering and analytics.

---

## Project Overview

The project involves:
1. **Data Architecture:** Designing a Modern Data Warehouse using Medallion Architecture with Bronze, Silver, and Gold layers.
2. **ETL Pipelines:** Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling:** Developing fact and dimension tables optimized for analytical queries.
4. **Analytics & Reporting:** Creating SQL-based reports and dashboards for actionable insights.

**This repository showcases expertise in:**
* SQL Development
* Data Architecture
* Data Engineering
* ETL Pipeline Development
* Data Modeling
* Data Analytics

---

## Important Links & Tools

* **Datasets:** Access to raw project datasets (ERP and CRM CSV files).
* **Database Engine:** PostgreSQL (or SQL Server Express) for hosting the data warehouse.
* **Query Tools:** VS Code / pgAdmin / DBeaver / SSMS.
* **Git & GitHub:** Version control and public project hosting.
* **Draw.io:** Architecture diagrams, data lineage, and dimensional models.
* **Notion:** Project tracking, sprint management, and task roadmaps.

---

## Project Requirements

### Building the Data Warehouse (Data Engineering)

**Objective:**  
Develop a modern data warehouse using PostgreSQL/SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

**Specifications:**
* **Data Sources:** Import data from two source systems (ERP and CRM) provided as CSV files.
* **Data Quality:** Cleanse and resolve data quality issues prior to analysis.
* **Integration:** Combine both sources into a single, user-friendly data model designed for analytical queries.
* **Scope:** Focus on the latest dataset only; historization of data is not required.
* **Documentation:** Provide clear documentation of the data model to support both business stakeholders and analytics teams.

### BI: Analytics & Reporting (Data Analytics)

**Objective:**  
Develop SQL-based analytics to deliver detailed insights into:
* Customer Behavior
* Product Performance
* Sales Trends

These insights empower stakeholders with key business metrics, enabling strategic decision-making.  
For more details, refer to `docs/requirements.md`.

---

## Data Architecture

The data architecture for this project follows the **Medallion Architecture** across Bronze, Silver, and Gold layers:

![Data Architecture](docs/data_architecture.png)

1. **Bronze Layer:** Stores raw data as-is from source systems. Data is ingested from CSV files into raw tables without schema modification.
2. **Silver Layer:** Applies data cleansing, deduplication, standardizations, data type casting, and schema normalization to prepare data for modeling.
3. **Gold Layer:** Houses business-ready data modeled into an analytical **Star Schema** (Dimension and Fact views) optimized for BI and reporting.

---

## 📁 Repository Structure

```text
data-warehouse-project/
│
├── datasets/                # Raw datasets used for the project (ERP and CRM CSVs)
│
├── docs/                    # Project documentation and architecture details
│   ├── etl.drawio           # Draw.io file showing ETL techniques and methods
│   ├── etl.png              # Exported ETL architecture diagram
│   ├── data_architecture.drawio # Medallion architecture diagram source
│   ├── data_architecture.png    # Medallion architecture image
│   ├── data_catalog.md      # Field definitions, mappings, and metadata
│   ├── data_flow.drawio     # Data pipeline flow diagram source
│   ├── data_flow.png        # Data pipeline flow image
│   ├── data_integration.drawio # CRM & ERP joining and integration logic
│   ├── data_integration.png    # Integration diagram image
│   ├── data_model.drawio    # Star Schema dimensional model diagram source
│   ├── data_model.png       # Star Schema dimensional model image
│   ├── naming_conventions.md# Standardization guidelines for schemas and tables
│   └── requirements.md      # Detailed business and technical specifications
│
├── scripts/                 # SQL scripts for DDL, ETL, and transformations
│   ├── bronze/              # DDL and ingestion scripts for raw data
│   ├── silver/              # DDL and ETL stored procedures for cleansed data
│   └── gold/                # Star schema dimension and fact views
│
├── tests/                   # Data validation and quality assurance test scripts
│   ├── quality_checks_silver.sql # Cleansing and integrity checks for Silver layer
│   └── quality_checks_gold.sql   # Surrogate key and relational checks for Gold layer
│
├── README.md                # Project overview and instructions
├── LICENSE                  # License terms for repository use (e.g., MIT)
├── .gitignore               # Files and paths ignored by Git
└── requirements.txt         # Any dependencies or Python setup requirements

## 🛡️ License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.

## 🌟 About Me

Hi there! I'm **Subodh Nikumbh**. I’m an IT professional and an aspiring data professional passionate about SQL, data engineering, and analytics. This project demonstrates my hands-on experience with SQL Server, ETL processes, data warehousing, and analytical reporting.


I’m continuously developing my skills by building practical, real-world data projects.

---
