
-- 05_data_quality_checks.sql
-- Purpose: Identify data quality issues in the synthetic source data.

-- 1. Customers with missing ages
SELECT
    customer_id,
    name,
    age
FROM customers
WHERE age IS NULL;

-- 2. Customers with missing email addresses
SELECT
    customer_id,
    name,
    email
FROM customers
WHERE email IS NULL;

-- 3. Duplicate email addresses
SELECT
    email,
    COUNT(*) AS occurrences
FROM customers
WHERE email IS NOT NULL
GROUP BY email
HAVING COUNT(*) > 1;

-- 4. Orders referencing customers who do not exist
SELECT
    o.order_id,
    o.customer_id
FROM orders AS o
LEFT JOIN customers AS c
    ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- 5. Order items with zero or negative quantities
SELECT
    order_item_id,
    order_id,
    product_id,
    quantity
FROM order_items
WHERE quantity <= 0;

-- 6. Orders with missing statuses
SELECT
    order_id,
    status
FROM orders
WHERE status IS NULL;

-- 7. Summary of row counts for the main tables
SELECT 'customers' AS table_name, COUNT(*) AS row_count
FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'employees', COUNT(*) FROM employees;
