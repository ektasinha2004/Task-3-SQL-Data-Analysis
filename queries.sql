DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT,
    city TEXT
);
INSERT INTO customers (customer_id, name, city)
VALUES
(1, 'Rahul', 'Kolkata'),
(2, 'Priya', 'Delhi'),
(3, 'Aman', 'Mumbai');
CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    price REAL
);
INSERT INTO products (product_id, product_name, price)
VALUES
(1, 'Laptop', 50000),
(2, 'Mouse', 800),
(3, 'Keyboard', 1500);
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    product_id INTEGER,
    quantity INTEGER
);
INSERT INTO orders (order_id, customer_id, product_id, quantity)
VALUES
(1, 1, 1, 2),
(2, 2, 2, 3),
(3, 3, 3, 1);
SELECT * FROM customers;
SELECT * FROM customers
WHERE city = 'Kolkata';
SELECT * FROM products
ORDER BY price DESC;
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city;
SELECT customers.name, products.product_name, orders.quantity
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN products ON orders.product_id = products.product_id;
SELECT product_id, SUM(quantity) AS total_quantity
FROM orders
GROUP BY product_id;
SELECT AVG(price) AS average_price
FROM products;
CREATE VIEW order_details AS
SELECT customers.name, products.product_name, orders.quantity
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN products ON orders.product_id = products.product_id;
SELECT * FROM order_details;
CREATE INDEX idx_customer_id
ON orders(customer_id);

SELECT * FROM order_details;
