-- =========================================
-- SQL Data Analysis Project
-- Author: Aditya Raj
-- Description: Self-driven SQL project analyzing e-commerce data to identify trends and business insights
-- =========================================


-- =========================================
-- 1. Total Sales
-- =========================================
--Insight: Identifies the total sales from the e-commerce data. 
SELECT SUM(sales) AS total_sales
FROM orders;


-- =========================================
-- 2. Total Orders
-- =========================================
--Insight: Identifies the total orders from the e-commerce data.
SELECT COUNT(DISTINCT `Order ID`) AS total_orders
FROM orders;


-- =========================================
-- 3. Sales by Ship mode 
-- =========================================
--Insight: Identifies the total sales done by ship mode from the e-commerce data.
SELECT `Ship Mode`, SUM(sales) AS total_sales 
FROM orders
GROUP BY `Ship Mode`
ORDER BY total_sales DESC;


-- =========================================
-- 4. Sales by Region
-- =========================================
--Insight: Identifies the total sales from the e-commerce data from particular regions.
SELECT Region, SUM(sales) AS total_sales
FROM orders
GROUP BY Region
ORDER BY total_sales DESC;


-- =========================================
-- 5. Sales by Category
-- =========================================
--Insight: Identifies the total sales according to different categories from the e-commerce data.
SELECT Category, SUM(sales) AS total_sales
FROM orders
GROUP BY Category
ORDER BY total_sales DESC;


-- =========================================
-- 6. Sales Over Time
-- =========================================
--Insight: Identifies the total sales over a period of time from the e-commerce data.
SELECT `Order Date`, SUM(sales) AS daily_sales
FROM orders 
GROUP BY `Order Date`
ORDER BY `Order Date`;


-- =========================================
-- 7. Monthly Sales 
-- =========================================
--Insight: Identifies the total sales within every month from the e-commerce data.
SELECT
    MONTH(STR_TO_DATE(`Order Date`,'%m/%d/%y')) AS month
    SUM(sales) AS total_sales
FROM orders
GROUP BY month
ORDER BY month;


-- =========================================
-- 8. Top 5 Customers
-- =========================================
--Insight: Identifies the top 5 Customers from the e-commerce data.
SELECT `Customer Name`, SUM(sales) AS total_spent
FROM orders
GROUP BY `Customer Name`
ORDER BY total_spent DESC
LIMIT 5;


-- =========================================
-- 9. Repeat Customers
-- =========================================
--Insight: Identifies the total no. of repeated customers from the e-commerce data.
SELECT `Customer Name`, COUNT(DISTINCT `Order ID`) AS order_count
FROM orders
GROUP BY `Customer Name`
HAVING order_count > 1
ORDER BY order_count DESC;


-- =========================================
-- 10. Monthly Sales Trend
-- =========================================
--Insight: Identifies the total monthly sales trend from the e-commerce data.
SELECT 
    DATE_FORMAT(STR_TO_DATE(`Order Date`, '%m/%d/%Y'), '%Y-%m') AS month,
    SUM(sales) AS total_sales
FROM orders
GROUP BY month
ORDER BY month;


-- =========================================
-- 11. Average Delivery Time
-- =========================================
--Insight: Identifies the average delivery time to ship the products from the e-commerce data.
SELECT 
    AVG(DATEDIFF(
        STR_TO_DATE(`Ship Date`, '%m/%d/%Y'),
        STR_TO_DATE(`Order Date`, '%m/%d/%Y')
    )) AS avg_delivery_days
FROM orders;


-- =========================================
-- 12. Customer Ranking 
-- =========================================
-- Insight: Helps identify high-value customers for targeted marketing strategies.
SELECT 
    `Customer Name`,
    SUM(sales) AS total_sales,
    RANK() OVER (ORDER BY SUM(sales) DESC) AS rank_position
FROM orders
GROUP BY `Customer Name`;


-- =========================================
-- 13. Top Products
-- =========================================
--Insight: Identifies the top products that got sold from the e-commerce data.
SELECT `Product Name`, SUM(sales) AS revenue
FROM orders
GROUP BY `Product Name`
ORDER BY revenue DESC
LIMIT 5;


-- =========================================
-- 14. Profit Analysis
-- =========================================
--Insight: Identifies the total profit from the e-commerce data.
SELECT Category, Sum(Profit) AS total_profit
FROM orders
GROUP BY Category
ORDER BY total_profit DESC;