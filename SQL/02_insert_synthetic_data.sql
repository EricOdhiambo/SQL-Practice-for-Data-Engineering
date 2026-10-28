-- Step 2: Adding data into created tables
-- The data inserted is a messy synthetic data generated from Claude AI.

-- Populating Customer table
-- cust_id, name, email, signup_date, region, age
INSERT INTO customers VALUES
(1, 'Amara Kone', 'amara.k@example.com', '2022-03-14', 'East', 29),
(2, 'Brian Otieno', 'brian.o@example.com', '2022-06-01', 'West', 34),
(3, 'Chidi Nwosu', 'chidi.n@example.com', '2023-01-20', 'East',  NULL),
(4, 'Diana Mwangi', 'diana.m@example.com', '2023-02-11', 'North', 41),
(5, 'Emeka Obi', 'emeka.o@example.com', '2021-11-05', 'South', 25),
(6, 'Fatima Yusuf', 'fatima.y@example.com', '2023-04-19', 'East', 38),
(7, 'George Kamau', NULL, '2022-08-23', 'West', 30),
(8, 'Halima Abdi', 'halima.a@example.com', '2023-06-30', 'North', NULL),
(9, 'Ibrahim Musa', 'ibrahim.m@example.com', '2022-01-15', 'South', 45),
(10, 'Joy Achieng', 'joy.a@example.com', '2023-03-02', 'East', 27),
(11, 'Kwame Boateng', 'kwame.b@example.com', '2021-09-10', 'West',  33),
(12, 'Linda Wafula', 'linda.w@example.com', '2023-07-14', 'North', 22),
(13, 'Moses Otieno', 'brian.o@example.com', '2023-05-01', 'East', 31),
(14, 'Naomi Chebet', 'naomi.c@example.com', '2022-12-09', 'South', 36),
(15, 'Omar Farah', 'omar.f@example.com', '2021-06-18', 'West', 28);

-- Populating Products table
-- prod_id, prod_name, category, cost
INSERT INTO products VALUES
(101, 'Wireless Mouse', 'Electronics', 8.00),
(102, 'Mechanical Keyboard', 'Electronics', 25.00),
(103, 'USB-C Hub', 'Electronics', 12.00),
(104, 'Notebook Set', 'Office', 3.50),
(105, 'Desk Lamp', 'Office', 15.00),
(106, 'Standing Desk', 'Office', 120.00),
(107, 'Yoga Mat', 'Fitness', 18.00),
(108, 'Resistance Bands', 'Fitness', 9.00);

-- Populating Orders table
-- order_id, customer_id, order_date, status, total_amount
INSERT INTO orders VALUES
(1001, 1, '2024-01-05', 'completed', 45.00),
(1002, 2, '2024-01-12', 'completed', 130.00),
(1003, 3, '2024-02-01', 'cancelled', 25.00),
(1004, 4, '2024-02-15', 'completed', 150.00),
(1005, 5, '2024-03-03', 'completed', 27.00),
(1006, 6, '2024-03-10', 'pending', 60.00),
(1007, 7, '2024-03-22', 'completed', 33.00),
(1008, 8, '2024-04-02', NULL, 18.00),
(1009, 9, '2024-04-18', 'completed', 145.00),
(1010, 10, '2024-05-01', 'completed', 21.50),
(1011, 11, '2024-05-14', 'cancelled', 40.00),
(1012, 12, '2024-06-02', 'completed', 33.00),
(1013, 13, '2024-06-20', 'completed', 130.00),
(1014, 14, '2024-07-05', 'completed', 27.00),
(1015, 15, '2024-07-19', 'completed', 138.00),
(1016, 1, '2024-08-02', 'completed', 25.00),
(1017, 2, '2024-08-15', 'completed', 21.50),
(1018, 4, '2024-09-01', 'completed', 120.00),
(1019, 99, '2024-09-10', 'completed', 60.00),
(1020, 9, '2024-09-25', NULL, 45.00);

-- Populating Order_items table
-- order_item_id , order_id, prod_id, quantity, unit_price
INSERT INTO order_items VALUES
(1, 1001, 101, 1, 8.00),
(2, 1001, 104, 3, 3.50),
(3, 1002, 102, 2, 25.00),
(4, 1002, 103, 5, 12.00),
(5, 1003, 105, 1, 15.00),
(6, 1004, 106, 1,120.00),
(7, 1004, 107, 1, 18.00),
(8, 1005, 108, 3, 9.00),
(9, 1006, 101, 2, 8.00),
(10,1007, 104, 4, 3.50),
(11,1008, 108, 2, 9.00),
(12,1009, 106, 1, 120.00),
(13,1009, 105, 1, 15.00),
(14,1010, 101, -2, 8.00),
(15,1011, 102, 1, 25.00),
(16,1012, 107, 1, 18.00),
(17,1013, 102, 2, 25.00),
(18,1013, 103, 5, 12.00),
(19,1014, 104, 4, 3.50),
(20,1015, 106, 1, 120.00),
(21,1015, 108, -2, 9.00),
(22,1016, 108, 1, 9.00),
(23,1017, 101, 1, 8.00),
(24,1017, 103, 1, 12.00),
(25,1018, 106, 1, 120.00),
(26,1019, 105, 1, 15.00),
(27,1020, 107, 2, 18.00);

-- Populating Employee table
-- emp_id, name, mngr_id, dept, hire_date, salary
INSERT INTO employees VALUES
(1, 'Sarah Njoroge',  NULL, 'Executive', '2018-01-10', 150000),
(2, 'Peter Kimani', 1, 'Sales', '2019-03-15', 95000),
(3, 'Grace Wambui', 1, 'Data', '2019-06-01', 98000),
(4, 'Daniel Ouma', 2, 'Sales', '2020-02-20', 65000),
(5, 'Esther Nyaga', 2, 'Sales', '2021-01-11', 62000),
(6, 'Victor Mutua', 3, 'Data', '2020-09-09', 72000),
(7, 'Aisha Bello', 3, 'Data', '2021-05-30', 70000),
(8, 'Samuel Kiptoo', 4, 'Sales', '2022-04-18', 58000),
(9, 'Ruth Auma', 6, 'Data', '2022-08-01', 61000),
(10, 'Tom Were', 4, 'Sales', '2023-01-25', 105000);