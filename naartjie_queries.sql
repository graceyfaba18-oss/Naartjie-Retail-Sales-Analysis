-- ================================================================
-- PROJECT 2: Naartjie Kids South Africa
-- Title:     Retail Sales Performance Analysis
-- Author:    Gracey F.
-- Tools:     SQLite | DB Browser for SQLite
-- Dataset:   Modelled on Sample Superstore Dataset (Kaggle)
--            https://www.kaggle.com/datasets/vivek468/superstore-dataset-final
--            Reframed as SA children's retail sales data
-- ================================================================
-- HOW TO USE:
-- 1. Open DB Browser for SQLite
-- 2. Click Open Database — select naartjie_sales.db
-- 3. Click Execute SQL tab
-- 4. Copy any query below and paste into the editor
-- 5. Press F5 to run
-- ================================================================


-- ================================================================
-- SECTION 1: SALES OVERVIEW
-- ================================================================

-- Q1: Total sales, profit and orders by year
SELECT
    SUBSTR(order_date,1,4)              AS year,
    COUNT(DISTINCT order_id)            AS total_orders,
    SUM(quantity)                       AS units_sold,
    ROUND(SUM(sales),2)                 AS total_sales_R,
    ROUND(SUM(profit),2)                AS total_profit_R,
    ROUND(SUM(profit)/SUM(sales)*100,1) AS profit_margin_pct
FROM sales
GROUP BY year
ORDER BY year;


-- Q2: Best performing month across all years
SELECT
    SUBSTR(order_date,1,7)              AS year_month,
    COUNT(DISTINCT order_id)            AS orders,
    ROUND(SUM(sales),2)                 AS monthly_sales_R,
    ROUND(SUM(profit),2)                AS monthly_profit_R
FROM sales
GROUP BY year_month
ORDER BY monthly_sales_R DESC
LIMIT 10;


-- ================================================================
-- SECTION 2: REGIONAL PERFORMANCE
-- ================================================================

-- Q3: Sales and profit by province
SELECT
    region                              AS province,
    COUNT(DISTINCT order_id)            AS orders,
    ROUND(SUM(sales),2)                 AS total_sales_R,
    ROUND(SUM(profit),2)                AS total_profit_R,
    ROUND(SUM(profit)/SUM(sales)*100,1) AS profit_margin_pct,
    ROUND(AVG(sales),2)                 AS avg_order_value_R
FROM sales
GROUP BY region
ORDER BY total_sales_R DESC;


-- Q4: Top 5 cities by sales revenue
SELECT
    city,
    region,
    COUNT(DISTINCT order_id)            AS orders,
    ROUND(SUM(sales),2)                 AS total_sales_R,
    ROUND(SUM(profit),2)                AS profit_R
FROM sales
GROUP BY city, region
ORDER BY total_sales_R DESC
LIMIT 5;


-- ================================================================
-- SECTION 3: PRODUCT PERFORMANCE
-- ================================================================

-- Q5: Sales and profit margin by product category
SELECT
    category,
    COUNT(*)                            AS transactions,
    SUM(quantity)                       AS units_sold,
    ROUND(SUM(sales),2)                 AS total_sales_R,
    ROUND(SUM(profit),2)                AS total_profit_R,
    ROUND(SUM(profit)/SUM(sales)*100,1) AS profit_margin_pct,
    ROUND(AVG(discount)*100,1)          AS avg_discount_pct
FROM sales
GROUP BY category
ORDER BY total_sales_R DESC;


-- Q6: Top 10 best selling individual products
SELECT
    product,
    category,
    SUM(quantity)                       AS units_sold,
    ROUND(SUM(sales),2)                 AS total_sales_R,
    ROUND(SUM(profit),2)                AS profit_R,
    ROUND(SUM(profit)/SUM(sales)*100,1) AS margin_pct
FROM sales
GROUP BY product, category
ORDER BY total_sales_R DESC
LIMIT 10;


-- Q7: Products with negative or very low profit margin (loss leaders)
SELECT
    product,
    category,
    ROUND(SUM(sales),2)                 AS total_sales_R,
    ROUND(SUM(profit),2)                AS total_profit_R,
    ROUND(SUM(profit)/SUM(sales)*100,1) AS margin_pct,
    ROUND(AVG(discount)*100,1)          AS avg_discount_pct
FROM sales
GROUP BY product, category
HAVING margin_pct < 10
ORDER BY margin_pct ASC;


-- ================================================================
-- SECTION 4: CUSTOMER SEGMENT ANALYSIS
-- ================================================================

-- Q8: Sales performance by customer segment
SELECT
    segment,
    COUNT(DISTINCT order_id)            AS orders,
    ROUND(SUM(sales),2)                 AS total_sales_R,
    ROUND(AVG(sales),2)                 AS avg_order_value_R,
    ROUND(SUM(profit),2)                AS total_profit_R,
    ROUND(SUM(profit)/SUM(sales)*100,1) AS profit_margin_pct
FROM sales
GROUP BY segment
ORDER BY total_sales_R DESC;


-- ================================================================
-- SECTION 5: DISCOUNT IMPACT ANALYSIS
-- ================================================================

-- Q9: How do discounts affect profit margins?
SELECT
    CASE
        WHEN discount = 0    THEN 'No Discount'
        WHEN discount <= 0.10 THEN 'Up to 10%'
        WHEN discount <= 0.20 THEN '11% to 20%'
        ELSE 'Over 20%'
    END                                 AS discount_band,
    COUNT(*)                            AS transactions,
    ROUND(SUM(sales),2)                 AS total_sales_R,
    ROUND(SUM(profit),2)                AS total_profit_R,
    ROUND(SUM(profit)/SUM(sales)*100,1) AS profit_margin_pct
FROM sales
GROUP BY discount_band
ORDER BY profit_margin_pct DESC;


-- ================================================================
-- SECTION 6: SHIPPING AND FULFILMENT
-- ================================================================

-- Q10: Sales and profit by shipping mode
SELECT
    ship_mode,
    COUNT(DISTINCT order_id)            AS orders,
    ROUND(SUM(sales),2)                 AS total_sales_R,
    ROUND(AVG(sales),2)                 AS avg_order_value_R,
    ROUND(SUM(profit)/SUM(sales)*100,1) AS profit_margin_pct
FROM sales
GROUP BY ship_mode
ORDER BY total_sales_R DESC;
