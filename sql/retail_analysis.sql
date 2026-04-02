-- =========================
-- TABLE CREATION
-- =========================

CREATE OR REPLACE TABLE CUSTOMERS (
    CUSTOMER_ID STRING,
    CUSTOMER_NAME STRING,
    REGION STRING,
    COUNTRY STRING,
    CITY STRING,
    STATE STRING,
    POSTAL_CODE STRING
);

-- (Similar structure used for PRODUCTS, ORDERS, ORDER_ITEMS)

-- =========================
-- DATA CLEANING
-- =========================

SELECT 
    ORDER_ID,
    TRY_TO_DATE(ORDER_DATE, 'MM/DD/YYYY') AS ORDER_DATE_CLEAN
FROM ORDERS;

-- =========================
-- CREATE VIEW
-- =========================

CREATE OR REPLACE VIEW SALES_VIEW AS
SELECT 
    o.ORDER_ID,
    o.ORDER_DATE,
    c.CUSTOMER_NAME,
    c.REGION,
    p.CATEGORY,
    p.SUB_CATEGORY,
    oi.SALES,
    oi.PROFIT,
    oi.QUANTITY
FROM ORDERS o
JOIN ORDER_ITEMS oi ON o.ORDER_ID = oi.ORDER_ID
JOIN CUSTOMERS c ON o.CUSTOMER_ID = c.CUSTOMER_ID
JOIN PRODUCTS p ON oi.PRODUCT_ID = p.PRODUCT_ID;

-- =========================
-- ANALYSIS QUERIES
-- =========================

-- Top Customers
SELECT 
    CUSTOMER_NAME,
    SUM(SALES) AS TOTAL_SPENT
FROM SALES_VIEW
GROUP BY CUSTOMER_NAME
ORDER BY TOTAL_SPENT DESC;

-- Negative Profit Count
SELECT COUNT(*) AS negative_profit_count
FROM SALES_VIEW
WHERE PROFIT < 0;

-- Total Loss
SELECT SUM(PROFIT) AS total_loss
FROM SALES_VIEW
WHERE PROFIT < 0;

-- Loss by Category
SELECT 
    CATEGORY,
    SUM(PROFIT) AS LOSS
FROM SALES_VIEW
WHERE PROFIT < 0
GROUP BY CATEGORY;

-- Loss Over Time
SELECT 
    DATE_TRUNC('MONTH', ORDER_DATE) AS MONTH,
    SUM(PROFIT) AS LOSS
FROM SALES_VIEW
WHERE PROFIT < 0
GROUP BY MONTH
ORDER BY MONTH;