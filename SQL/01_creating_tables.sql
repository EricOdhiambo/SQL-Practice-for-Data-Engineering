-- Step1: Creating tables
CREATE TABLE IF NOT EXISTS customers(
  customer_id INT PRIMARY KEY,
  name TEXT,
  email TEXT,
  signup_date DATE,
  region TEXT,
  age INT
);

CREATE TABLE IF NOT EXISTS products(
  product_id INT PRIMARY KEY,
  product_name TEXT,
  category TEXT,
  cost NUMERIC
);

CREATE TABLE IF NOT EXISTS orders(
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  status TEXT,
  total_amount NUMERIC
);

CREATE TABLE IF NOT EXISTS order_items(
  order_item_id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  unit_price NUMERIC
);

CREATE TABLE IF NOT EXISTS employees(
  employee_id INT PRIMARY KEY,
  name TEXT,
  manager_id INT,
  department TEXT,
  hire_date DATE,
  salary NUMERIC
);