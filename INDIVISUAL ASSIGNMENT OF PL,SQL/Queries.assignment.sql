-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    region VARCHAR(50)
);
-- DESCRIBE customers
DESC customers;

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50)
);
-- DESCRIBE products.
DESC Products;
-- Transactions Table
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- DESCRIBE transactions
DESC Transactions;
-- Insert Customers
INSERT INTO customers VALUES (101, 'Elyse Niyomwungere', 'Kigali');
INSERT INTO customers VALUES (102, 'Moise Ndaruhutse', 'Kirehe');
INSERT INTO customers VALUES (103, 'Divin Araje', 'Rubavu');
INSERT INTO customers VALUES (104, 'Umutoni Wase Sonia', 'Kayonza');
INSERT INTO customers VALUES (105, 'Alliance Ishimwe', 'Rwamagana');

-- Select From Customers
SELECT * FROM CUSTOMERS;

-- Insert Products
INSERT INTO products VALUES (201, 'iPhone 14', 'Smartphone');
INSERT INTO products VALUES (202, 'Dell Laptop', 'Laptop');
INSERT INTO products VALUES (203, 'Charger', 'Accessory');
INSERT INTO products VALUES (204, 'AirPods', 'Headphones');
INSERT INTO products VALUES (205, 'HP Laptop', 'Laptop');

--Select From Products
SELECT * FROM PRODUCTS;

-- Insert Transactions
INSERT INTO transactions VALUES (301, 101, 201);
INSERT INTO transactions VALUES (302, 102, 202);
INSERT INTO transactions VALUES (303, 103, 203);
INSERT INTO transactions VALUES (304, 104, 204);
INSERT INTO transactions VALUES (305, 105, 205);

-- Select From Transactions
SELECT * FROM TRANSACTION;
SELECT * FROM TRANSACTIONS;
-- Find the top-selling products in each region
SELECT 
    c.region,
    p.name AS product_name,
    COUNT(t.transaction_id) AS total_sales,
    RANK() OVER (PARTITION BY c.region ORDER BY COUNT(t.transaction_id) DESC) AS sales_rank,
    DENSE_RANK() OVER (PARTITION BY c.region ORDER BY COUNT(t.transaction_id) DESC) AS dense_rank,
    ROW_NUMBER() OVER (PARTITION BY c.region ORDER BY COUNT(t.transaction_id) DESC) AS row_num
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
JOIN products p ON t.product_id = p.product_id
GROUP BY c.region, p.name;

-- Calculate running totals and moving averages for product categories
SELECT 
    p.category,
    COUNT(t.transaction_id) AS monthly_sales,
    SUM(COUNT(t.transaction_id)) OVER (PARTITION BY p.category ORDER BY p.category) AS running_total,
    AVG(COUNT(t.transaction_id)) OVER (PARTITION BY p.category ORDER BY p.category ROWS 2 PRECEDING) AS moving_avg
FROM transactions t
JOIN products p ON t.product_id = p.product_id
GROUP BY p.category;

-- Analyze month-to-month sales growth per region
SELECT 
    c.region,
    COUNT(t.transaction_id) AS total_sales,
    LAG(COUNT(t.transaction_id), 1) OVER (PARTITION BY c.region ORDER BY c.region) AS prev_sales,
    LEAD(COUNT(t.transaction_id), 1) OVER (PARTITION BY c.region ORDER BY c.region) AS next_sales,
    (COUNT(t.transaction_id) - LAG(COUNT(t.transaction_id), 1) OVER (PARTITION BY c.region ORDER BY c.region)) AS growth
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
GROUP BY c.region;

-- Segment customers into quartiles based on total purchases
SELECT 
    c.name,
    c.region,
    COUNT(t.transaction_id) AS total_purchases,
    NTILE(4) OVER (ORDER BY COUNT(t.transaction_id) DESC) AS customer_quartile,
    CUME_DIST() OVER (ORDER BY COUNT(t.transaction_id)) AS cumulative_distribution
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.name, c.region;

SELECT COUNT(*) AS total_customers FROM customers;
SELECT COUNT(*) AS total_products FROM products;
SELECT COUNT(*) AS total_transactions FROM transactions;
-- Total sales per product
SELECT 
    p.name AS product_name,
    COUNT(t.transaction_id) AS total_sales
FROM transactions t
JOIN products p ON t.product_id = p.product_id
GROUP BY p.name;

-- Total sales per region
SELECT 
    c.region,
    COUNT(t.transaction_id) AS total_sales
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
GROUP BY c.region;

-- Show sales with customer names, product names, and regions

SELECT 
    t.transaction_id,
    c.name AS customer_name,
    c.region,
    p.name AS product_name,
    p.category
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
JOIN products p ON t.product_id = p.product_id;

