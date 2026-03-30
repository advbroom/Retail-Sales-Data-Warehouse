USE supply_chain_project;

DROP TABLE IF EXISTS dim_date;

CREATE TABLE dim_date AS
SELECT DISTINCT
order_date
FROM raw_orders;

SELECT * FROM dim_date LIMIT 10;