--Which customers placed the most orders?

SELECT
a.customer_name,
a.customer_id,
count(order_id) as total_order
FROM customers as a
LEFT JOIN orders as b
on a.customer_id = b. customer_id
GROUP BY 1,2
ORDER BY total_order DESC
LIMIT 10

------------------------------------------------
--Which countries have the most registered customers?
SELECT 
    country, 
    COUNT(*) AS customer_count
FROM customers
GROUP BY country
ORDER BY customer_count DESC;

------------------------------------------------
--Which cities generate the highest total order amount?
SELECT 
    c.city, 
    SUM(CAST(o.order_amount as INT)) AS total_sales
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY total_sales DESC
LIMIT 10;

--------------------------------------------------------
--What is the average order value by product category?
SELECT 
    product_category, 
    ROUND(AVG(CAST(order_amount as int)),0) AS avg_order_value
FROM orders
GROUP BY product_category
ORDER BY avg_order_value DESC;
--------------------------------------------------------
--How many customers registered each year?
SELECT 
    EXTRACT(YEAR FROM registration_date) AS reg_year, 
    COUNT(*) AS customer_count
FROM customers
GROUP BY reg_year
ORDER BY reg_year;
--------------------------------------------------------
--Which customers have spent the most overall?
c.customer_id,
c.customer_name,
ROUND(SUM(o.order_amount),0) AS total_spent
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
GROUP BY 1,2
ORDER BY total_spent DESC
LIMIT 10;

--------------------------------------------------------
--What is the order status breakdown?
SELECT 
status, 
COUNT(*) AS order_count
FROM orders
GROUP BY status;

--------------------------------------------------------
--What are the top 5 most ordered product categories by revenue?
SELECT 
    product_category, 
    CAST(SUM(order_amount) as INT) AS total_revenue
FROM orders
GROUP BY product_category
ORDER BY total_revenue DESC
LIMIT 5;
--------------------------------------------------------
--How does order volume change year by year?
SELECT 
    DATE_TRUNC('year', order_date) AS order_year, 
    COUNT(*) AS order_count
FROM orders
GROUP BY order_year
ORDER BY order_year;
--------------------------------------------------------
--Which country has the highest average order amount?
SELECT 
    c.country, 
    ROUND(AVG(o.order_amount),0) AS avg_order_value
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
GROUP BY c.country
ORDER BY avg_order_value DESC;
--------------------------------------------------------
--How engaged are our customers based on their order activity? Specifically, how many orders has each customer placed, and how can we classify them into meaningful segments like 'One-time', 'Returning', or 'Loyal' customers?
SELECT 
    c.customer_id,
    c.customer_name,
    order_stats.order_count,
    CASE 
        WHEN order_stats.order_count = 1 THEN 'One-time'
        WHEN order_stats.order_count BETWEEN 2 AND 4 THEN 'Returning'
        ELSE 'Loyal'
    END AS customer_type
FROM customers c
JOIN (
    SELECT 
        customer_id,
        COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_id
) AS order_stats
ON c.customer_id = order_stats.customer_id;



