USE supply_chain_project;
DROP DATABASE IF EXISTS retail_sales_dw;
CREATE DATABASE retail_sales_dw;
USE retail_sales_dw;

-- STAGING TABLE
CREATE TABLE raw_orders (
order_id INT,
order_date DATE,
ship_mode VARCHAR(50),
segment VARCHAR(50),
country VARCHAR(50),
city VARCHAR(50),
state VARCHAR(50),
postal_code INT,
region VARCHAR(50),
category VARCHAR(50),
sub_category VARCHAR(50),
product_id VARCHAR(50),
cost_price DECIMAL(10,2),
list_price DECIMAL(10,2),
quantity INT,
discount_percent INT
);

-- STAGING TABLE-- 
CREATE TABLE dim_product AS
SELECT DISTINCT
product_id,
category,
sub_category
FROM raw_orders;

CREATE TABLE dim_location AS
SELECT 
    ROW_NUMBER() OVER () AS location_key,
    city,
    state,
    region,
    country
FROM (
    SELECT DISTINCT city, state, region, country
    FROM raw_orders
) t;

CREATE TABLE dim_date AS
SELECT DISTINCT
order_date
FROM raw_orders;

CREATE TABLE dim_segment AS
SELECT DISTINCT
segment
FROM raw_orders;

-- FACT TABLE
DROP TABLE fact_sales;

CREATE TABLE fact_sales AS
SELECT
r.order_id,
r.order_date,
r.product_id,
d.location_key,
r.segment,   -- 🔥 IMPORTANT ADD THIS
r.quantity,
r.cost_price,
r.list_price,
r.discount_percent,
(r.quantity * r.list_price) AS revenue,
(r.quantity * (r.list_price - r.cost_price)) AS profit
FROM raw_orders r
JOIN dim_location d
ON r.city = d.city;

