# SQL-data-warehouse-project
Building a data warehouse with MySQL (including ETL processes, data modelling and data analytics)

# Customer & Sales Analytics Data Warehouse (MySQL · Medallion Architecture)

This project is an end-to-end **SQL data warehouse** for customer and sales analytics built on **MySQL**, following the **Medallion Architecture (Bronze → Silver → Gold)**.

It ingests and models data from **6 CSV source files** with a total of **116,294 rows** into:

- **6 Bronze tables** (raw landing)
- **6 Silver tables** (cleaned, conformed)
- **3 Gold views** (2 dimensions + 1 fact for analytics)
- **19 SQL-based data quality checks** across Silver and Gold layers

The result is a **star-schema analytical layer** ready for **data science, data engineering, data analytics, and actuarial-style reporting & modelling**.

---

## Project Objectives

- Design and build a **modern warehouse-style data model** on MySQL using **Medallion Architecture**.
- Implement robust **ETL/ELT pipelines** from raw CSVs through to **business-ready views**.
- Apply **data quality and validation checks** to ensure reliable downstream analytics.
- Demonstrate practical skills that align with realistic entry-level roles in **data science, data engineering, data analytics, and actuarial** work.


---

## Data Architecture (Medallion Architecture)

The data architecture follows a **Bronze → Silver → Gold** layered pattern.

### Bronze Layer – Raw Ingestion

- **Purpose:** Store data **as-is** from source systems.
- **Source:** 6 CSV files (e.g. customer, product, sales, location, pricing mappings).
- **Technology:** `LOAD DATA INFILE` into the **`bronze`** schema.
- **Tables (examples):**
  - `bronze.crm_cust_info`
  - `bronze.crm_prd_info`
  - `bronze.crm_sales_details`
  - `bronze.erp_cust_az12`
  - `bronze.erp_loc_a101`
  - `bronze.erp_px_cat_g1v2`

At this stage, data may include **nulls, inconsistent formats, and non-standard codes**.

---

### Silver Layer – Cleaned & Standardised

- **Purpose:** Apply **data cleansing, standardisation, and normalization** to prepare data for analytics / modelling.
- **Technology:** SQL transformations in the **`silver`** schema.
- **Key transformations:**
  - Standardising **customer, product, location and pricing attributes**.
  - Cleaning **string fields** (trimming spaces, standard casing).
  - Converting **dates** to proper types and validating ranges.
  - Normalising and joining **auxiliary mapping tables** from ERP-style sources.

- **Tables (1:1 with bronze):**
  - `silver.crm_cust_info`
  - `silver.crm_prd_info`
  - `silver.crm_sales_details`
  - `silver.erp_cust_az12`
  - `silver.erp_loc_a101`
  - `silver.erp_px_cat_g1v2`

This layer is the **single source of truth** for consistent, well-typed operational data.

---

### Gold Layer – Business-Ready Star Schema

- **Purpose:** Provide **analytics-friendly**, **business-ready** data for:
  - KPI reporting and dashboards
  - Exploratory data analysis
  - Data science / machine learning
  - Actuarial-style trend and risk analysis

- **Technology:** Views in the **`gold`** schema, modelled into a **star schema**.

- **Gold views:**
  - `gold.dim_customers`
  - `gold.dim_products`
  - `gold.facts_sales`

#### Star Schema Design

- **`gold.dim_customers`**
  - Surrogate key using `ROW_NUMBER()` as `customer_key`.
  - Attributes such as customer ID, name, location, and other profile fields.
  - Supports segmentation, cohorting, and geographic analysis.

- **`gold.dim_products`**
  - Surrogate key using `ROW_NUMBER()` as `product_key`.
  - Attributes such as product ID, category, and price-related metadata.
  - Supports product mix / margin / category analysis.

- **`gold.fact_sales`**
  - Central **fact table** keyed by `customer_key` and `product_key`.
  - Measures such as:
    - `sales_amount`
    - `quantity`
    - `price`
    - Order, shipment, and due dates.
  - Enables **time-based revenue/volume analysis** and customer/product performance reporting.

---

## Data Quality & Validation

Data quality is checked at **Silver** and **Gold** layers using **19 SQL-based checks**:

- **Silver layer checks (16+ queries) include:**
  - Null and duplicate primary keys.
  - Trimming and detection of **leading/trailing spaces**.
  - Standardisation checks on key fields (e.g. codes, statuses).
  - Invalid or inconsistent **date ranges** and ordering.
  - Consistency between related fields across Silver tables.

- **Gold layer checks (3+ queries) include:**
  - Referential integrity between `gold.fact_sales`, `gold.dim_customers`, and `gold.dim_products`.
  - Ensuring that every fact record links to valid dimension keys.

These checks help ensure the pipeline delivers **trustworthy, analysis-ready data**.

---

## Source Data

The warehouse is built from **6 CSV files** totalling **116,294 rows**, including:

- Customer master data
- Product master data
- Sales transaction details
- Location and pricing mapping tables

These files are ingested into **Bronze**, cleaned and conformed in **Silver**, and then aggregated/modelled into **Gold**.

---

## Skills Demonstrated (and Strengthened)

This project is intentionally aligned with **data science, data engineering, data analytics, and actuarial** entry-level roles.

**Core technical skills:**

- **SQL / MySQL**
  - DDL and DML for creating schemas and tables.
  - Complex joins, CASE expressions, and NULL handling.
  - Use of **window functions** (`ROW_NUMBER()`) to generate surrogate keys.
  - Data type conversions, date functions, and conditional logic.

- **Data Engineering / ETL**
  - Ingestion from **CSV files** using MySQL (`LOAD DATA`).
  - Layered **Bronze → Silver → Gold** transformations.
  - Separation of concerns between raw, cleaned, and business-ready data.
  - Re-runnable scripts for reproducible pipelines.

- **Data Modelling**
  - Designing **star-schema** models with **fact** and **dimension** structures.
  - Creating **surrogate keys** and maintaining referential integrity.
  - Organising data for **fast analytical queries**.

- **Data Quality & Governance**
  - Implementing automated **quality checks** (nulls, duplicates, invalid dates, connectivity).
  - Ensuring reliable input data for **dashboards, ML models, or actuarial analyses**.

**Analysis-oriented skills relevant to Data Science / Analytics / Actuarial work:**

- Ability to derive **time-based revenue and volume trends**.
- Customer and product-level performance analysis.
- A clean, well-structured fact table suitable for:
  - **Predictive models** (e.g., churn, propensity, pricing).
  - **Actuarial-style** trend, exposure, or portfolio analysis (e.g., frequency/severity by cohort once additional measures are added).

---

## Repository Structure

A typical structure for this project could be:

```text
.
├── datasets/                        
│   ├── cust_info.csv
│   ├── prd_info.csv
│   ├── sales_details.csv
│   ├── CUST_AZ12.csv
│   ├── LOC_A101.csv
│   └── PX_CAT_G1V2.csv
│
├── scripts/
|   └── create_databases.sql                          
│   ├── bronze/
|       ├── create_bronze_tables.sql
|       └──load_bronze_data.sql           
│   ├── silver/
|       ├── create_silver_tables.sql
│       └── load_and_clean_silver_data.sql                    
│   ├── gold/
|       └── create_gold_views.sql                      
│
├── tests/
|   ├── quality_checks_silver_data.sql
│   └── quality_checks_gold_data.sql                             
│
├── README.md                        
└── LICENSE                            


## Contact

If you’d like to connect or discuss this project:

- **LinkedIn:** https://www.linkedin.com/in/godwin-abia-9b8733293/



