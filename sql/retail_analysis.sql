=========================
SETUP
=========================

CREATE WAREHOUSE IF NOT EXISTS my_wh WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' AUTO_SUSPEND = 300 AUTO_RESUME = TRUE;

CREATE DATABASE IF NOT EXISTS retail_db;

CREATE SCHEMA IF NOT EXISTS retail_schema;

USE WAREHOUSE my_wh;

USE DATABASE retail_db;

USE SCHEMA retail_schema;


----------------------------------------------------------

==========================
TABLE CREATION
==========================

CREATE OR REPLACE TABLE Customers (
    customer_id STRING,
    customer_name STRING,
    region STRING,
    country STRING,
    city STRING,
    state STRING,
    postal_code STRING
);

-- Similar CREATE TABLE statements used for Products, Orders, and Order_Items
----------------------------------------------------
==============================
DATA CLEANING
==============================


--- AI-GENERATED TO_DATE() QUERY

CREATE OR REPLACE TABLE Orders_Clean AS
SELECT 
    order_id,
    TO_DATE(order_date, 'MM-DD-YYYY') AS order_date,
    customer_id,
    ship_mode,
    segment,
    TO_DATE(ship_date, 'MM-DD-YYYY') AS ship_date
FROM Orders;



--- MANUAL QUERY

CREATE OR REPLACE TABLE Orders_Clean AS
SELECT 
    order_id,

    COALESCE(
        TRY_TO_DATE(order_date, 'MM-DD-YYYY'),
        TRY_TO_DATE(order_date, 'MM/DD/YYYY')
    ) AS order_date,

    customer_id,
    ship_mode,
    segment,

    COALESCE(
        TRY_TO_DATE(ship_date, 'MM-DD-YYYY'),
        TRY_TO_DATE(ship_date, 'MM/DD/YYYY')
    ) AS ship_date

FROM Orders;


SELECT 
    ORDER_ID,
    TRY_TO_DATE(ORDER_DATE, 'MM/DD/YYYY') AS ORDER_DATE_CLEAN
FROM ORDERS;


-----------------------------------------------------

===================
DATA MODEL (VIEW)
===================

CREATE OR REPLACE VIEW sales_view AS
SELECT 
    o.order_id,
    o.order_date,
    o.customer_id,
    c.customer_name,
    c.region,
    c.city,
    p.product_name,
    p.category,
    p.sub_category,
    oi.sales,
    oi.quantity,
    oi.discount,
    oi.profit
FROM Orders_Clean o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id;

----------------------------------------------------------

========================
ANALYSIS
========================

--- Total Revenue

SELECT SUM(sales) AS total_revenue
FROM sales_view;

--- Monthly Sales Trend

SELECT 
    DATE_TRUNC('month', order_date) AS month,
    SUM(sales) AS total_sales
FROM sales_view
GROUP BY month
ORDER BY month;

--- TOP CUSTOMERS

SELECT 
    customer_name,
    SUM(sales) AS total_spent
FROM sales_view
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 10;


--- TOP PRODUCTS


SELECT 
    product_name,
    SUM(sales) AS total_sales
FROM sales_view
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

--- Monthly Profit Trend

SELECT 
    DATE_TRUNC('month', order_date) AS month,
    ROUND(SUM(profit), 2) AS profit
FROM sales_view
GROUP BY month
ORDER BY month;

--- PROFIT BY CATEGORY

SELECT 
    category,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_view
GROUP BY category
ORDER BY total_profit;


---------------------------------------------

=====================
DATA QUALITY CHECKS
=====================

--- Negative Profit Transactions (RAW DATA)
SELECT COUNT(*) AS negative_profit_transactions
FROM Order_Items
WHERE profit < 0;

--- Total Loss (RAW DATA)
SELECT ROUND(SUM(profit), 2) AS total_loss
FROM Order_Items
WHERE profit < 0;


--- Negative Profit Count

SELECT COUNT(*) AS negative_profit_transaction
FROM SALES_VIEW 
WHERE PROFIT < 0;


--- Validation using View
SELECT ROUND(SUM(profit), 2) FROM sales_view WHERE profit < 0;

---------------------------------------------

=============================
LOSS ANALYSIS
=============================


--- Total Loss
SELECT ROUND(SUM(profit), 2) AS total_loss
FROM sales_view
WHERE profit < 0;

--- Loss Over Time
SELECT 
    DATE_TRUNC('month', order_date) AS month,
    ROUND(SUM(profit), 2) AS total_loss
FROM sales_view
WHERE profit < 0
GROUP BY month
ORDER BY month;

--- Loss by Category
SELECT 
    category,
    ROUND(SUM(profit), 2) AS total_loss
FROM sales_view
WHERE profit < 0
GROUP BY category
ORDER BY total_loss;

-----------------------------------------------

====================================
NULL VALIDATION
====================================

SELECT *
FROM Orders_Clean o
LEFT JOIN Customers c 
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SELECT *
FROM Order_Items oi
LEFT JOIN Products p
ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;

--------------------------------------------------

SELECT * FROM sales_view;


