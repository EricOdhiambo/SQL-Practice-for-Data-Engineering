-- Step 4: Practice set
-- Section A — Extraction & Filtering
-- 1. Return all customers from the 'East' region who signed up after 2023-01-01.
SELECT *
FROM customers
WHERE region = 'East' AND signup_date > '2023-01-01';

-- 2. Return all orders with a total_amount greater than 100, sorted by order_date descending.
SELECT *
FROM orders
WHERE total_amount > 100
ORDER BY order_date DESC;

-- 3. Count how many orders have a status of 'cancelled'.
SELECT COUNT(*) AS cancelled_orders
FROM orders
WHERE status = 'cancelled';

-- Section B — Joins & Aggregation
-- 4. Return each customer's name along with the total number of orders they've placed (include customers with zero orders).
SELECT c.customer_id, c.name, COUNT(o.order_id) AS total_orders
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY c.customer_id;  

-- 5. Calculate total revenue (quantity * unit_price) for each product category.
SELECT p.category, SUM(oi.quantity * oi.unit_price) AS total_revenue 
FROM order_items AS oi
JOIN products AS p
ON oi.product_id = p.product_id
GROUP BY p.category;

-- 6. Find the average total_amount of orders, grouped by region, only for 'completed' orders.
SELECT c.region, AVG(o.total_amount) AS avg_orders
FROM orders AS o
JOIN customers AS c
ON o.customer_id = c.customer_id  
WHERE o.status = 'completed'
GROUP BY c.region;

-- Section C — Data Cleaning Basics
-- 7. Replace any NULL values in customers.age with the average age of all customers.
SELECT customer_id, name, age,  
       COALESCE(age, (SELECT AVG(age) FROM customers)) AS filled_age
FROM customers
GROUP BY customer_id;

-- 8. Count how many rows in customers have a NULL email.
SELECT COUNT(*) AS blank_emails_rows
FROM customers
WHERE email IS NULL;

-- 9. Write a query that standardizes orders.status so any NULL becomes 'unknown' (without changing the actual table).
SELECT order_id, COALESCE(status, 'unknown')  AS order_status
FROM orders

-- Section D — Simple Window Functions
-- 10. For each order, show its total_amount alongside the average order value for that customer's region (using a window function, not a subquery).
SELECT 
       order_id,
       c.region,
       o.total_amount,
       AVG(o.total_amount) OVER (
              PARTITION BY c.region
       ) AS regional_avg_order_value
FROM orders AS o 
JOIN customers AS c
 ON o.customer_id = c.customer_id
 ORDER BY c.region, o.order_id;

-- 11. Rank customers by total spend, highest first, using RANK().
SELECT
       c.customer_id,
       c.name,
       COALESCE(SUM(o.total_amount), 0) AS total_spend,
       RANK() OVER(ORDER BY COALESCE(SUM(o.total_amount), 0) DESC) AS spend_rank
FROM customers AS c
LEFT JOIN orders AS o 
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name, o.total_amount
ORDER BY spend_rank DESC;

-- Section E — Basic Stats Concepts
-- 12. Calculate the mean and median of total_amount across all orders. Are they close together or far apart, and what would that suggest about the data's shape?
SELECT
       AVG(total_amount) AS mean_of_total_amount,
       PERCENTILE_CONT(0.5) WITHIN GROUP (
              ORDER BY total_amount) AS median_of_total_amount
FROM orders;

