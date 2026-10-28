-- Step3: Counting rows for each populated table
SELECT 'customers' AS table_name, COUNT(*) AS row_count
FROM customers

UNION ALL

SELECT 'products', COUNT(*) 
FROM products

UNION ALL

SELECT 'orders', COUNT(*) 
FROM orders

UNION ALL

SELECT 'order_items', COUNT(*)
FROM order_items

UNION ALL

SELECT 'employees', COUNT(*)
FROM employees;