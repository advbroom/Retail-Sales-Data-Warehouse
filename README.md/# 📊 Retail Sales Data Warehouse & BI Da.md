#  Retail Sales Data Warehouse & BI Dashboard

## Overview
This project demonstrates an end-to-end data analytics pipeline, transforming raw retail sales data into structured insights using a data warehouse and Power BI dashboard.

---

##  Objective
To design a data warehouse and analytics system that enables analysis of:
- Product demand
- Sales performance
- Profitability
- Customer segments

The goal is to support data-driven decision-making in retail.

---

## Tech Stack
- MySQL (Data Warehouse)
- SQL (ETL + Analysis)
- Power BI (Dashboard)

---

##  Data Architecture
- **Staging Table:** raw_orders
- **Dimension Tables:** dim_product, dim_location, dim_date, dim_segment
- **Fact Table:** fact_sales

---

##  ETL Process
1. Loaded raw CSV data into staging table
2. Cleaned and transformed data
3. Created dimension tables
4. Built fact table with calculated metrics (revenue, profit)

---

##  Key Metrics
- Total Revenue
- Total Profit
- Total Orders
- Average Order Value (AOV)

---

##  Dashboard Insights
- Sales trend over time
- Category-wise revenue distribution
- Top-performing products
- Business performance overview

---

##  Dashboard Preview
![Dashboard](screenshots/dashboard.png)

---

##  Key Learnings
- Data warehouse design (star schema)
- ETL pipeline development
- SQL-based analytics
- Data visualization using Power BI
