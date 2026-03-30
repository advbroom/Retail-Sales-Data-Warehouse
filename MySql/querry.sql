USE supply_chain_project;

SELECT SUM(revenue) AS total_revenue
FROM fact_sales;

SELECT
MONTH(order_date) AS month,
SUM(revenue) AS monthly_sales
FROM fact_sales
GROUP BY month
ORDER BY month;

SELECT
product_id,
SUM(quantity) AS units_sold
FROM fact_sales
GROUP BY product_id
ORDER BY units_sold DESC
LIMIT 10;

SELECT
region,
SUM(quantity * list_price) AS revenue
FROM raw_orders
GROUP BY region;

SELECT
product_id,
SUM(profit) AS total_profit
FROM fact_sales
GROUP BY product_id
ORDER BY total_profit DESC
LIMIT 10;

SELECT
product_id,
SUM(revenue) AS total_revenue,
RANK() OVER (ORDER BY SUM(revenue) DESC) AS revenue_rank
FROM fact_sales
GROUP BY product_id;

SELECT
order_date,
SUM(revenue) AS daily_sales,
SUM(SUM(revenue)) OVER (ORDER BY order_date) AS running_total
FROM fact_sales
GROUP BY order_date;

SELECT
order_date,
AVG(revenue) OVER (
ORDER BY order_date
ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
) AS moving_avg_sales
FROM fact_sales;

SET SQL_SAFE_UPDATES = 0;

ALTER TABLE fact_sales ADD location_key INT;

UPDATE fact_sales f
JOIN dim_location d
ON f.city = d.city
SET f.location_key = d.location_key;
 
 SELECT city, location_key 
FROM fact_sales 
LIMIT 10;

SELECT city, location_key 
FROM fact_sales 
LIMIT 10;

SELECT * FROM dim_date LIMIT 10;

SELECT USER();
