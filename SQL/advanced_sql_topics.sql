-- Advanced SQL Topics: Normalization, Denormalization, Indexes, Views, and Stored Procedures

-- 1. Introduction
-- This file will demonstrate more advanced SQL topics such as:
--   - Normalization and Denormalization
--   - Indexes
--   - Views
--   - Stored Procedures

-- 2. Normalization
-- Normalization is the process of organizing a database to minimize redundancy and dependency.
-- It typically involves dividing a database into smaller tables and linking them using relationships.
-- There are several normal forms, but the most common are:
--   - First Normal Form (1NF)
--   - Second Normal Form (2NF)
--   - Third Normal Form (3NF)

-- Example: Normalization process

-- Original "Unnormalized" Table (contains duplicate and redundant data)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    product_price DECIMAL(10, 2),
    order_date DATE
);

-- Insert some sample unnormalized data
INSERT INTO orders (order_id, customer_name, product_name, product_price, order_date)
VALUES
    (1, 'John Doe', 'Laptop', 999.99, '2025-03-27'),
    (2, 'Jane Smith', 'Phone', 699.99, '2025-03-27'),
    (3, 'John Doe', 'Tablet', 499.99, '2025-03-27');

-- 2.1 First Normal Form (1NF)
-- To meet the 1NF, we must ensure:
--   - There are no repeating groups (e.g., columns that store multiple values).
--   - Each column contains atomic values (no arrays or lists).

-- In our example, the table already adheres to 1NF because each column stores atomic values.

-- 2.2 Second Normal Form (2NF)
-- To meet the 2NF, the table must:
--   - Be in 1NF.
--   - Remove partial dependency (all non-key columns must depend on the whole primary key).

-- In the original table, the customer_name depends on the order_id, but product_name and product_price depend on the product.
-- To achieve 2NF, we split the data into two tables:

-- Create a customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

-- Insert customer data (note that customer_id is now separate)
INSERT INTO customers (customer_id, customer_name)
VALUES
    (1, 'John Doe'),
    (2, 'Jane Smith');

-- Create a products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    product_price DECIMAL(10, 2)
);

-- Insert product data
INSERT INTO products (product_id, product_name, product_price)
VALUES
    (1, 'Laptop', 999.99),
    (2, 'Phone', 699.99),
    (3, 'Tablet', 499.99);

-- Create the orders table now that data is normalized
CREATE TABLE orders_normalized (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert normalized order data
INSERT INTO orders_normalized (order_id, customer_id, product_id, order_date)
VALUES
    (1, 1, 1, '2025-03-27'),
    (2, 2, 2, '2025-03-27'),
    (3, 1, 3, '2025-03-27');

-- 2.3 Third Normal Form (3NF)
-- To meet the 3NF, the table must:
--   - Be in 2NF.
--   - Remove transitive dependency (non-key columns must depend only on the primary key).

-- In our normalized example, we have achieved 3NF because no column depends on any other non-key column.

-- 3. Denormalization
-- Denormalization is the process of introducing redundancy into a database by combining tables.
-- This is often done to optimize query performance, especially for read-heavy systems.
-- However, it sacrifices the benefits of normalization (such as reduced data redundancy).

-- Example: Denormalized table (combining order details with customer and product information)

CREATE TABLE orders_denormalized (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    product_price DECIMAL(10, 2),
    order_date DATE
);

-- Insert denormalized data (combining all information into one table)
INSERT INTO orders_denormalized (order_id, customer_name, product_name, product_price, order_date)
VALUES
    (1, 'John Doe', 'Laptop', 999.99, '2025-03-27'),
    (2, 'Jane Smith', 'Phone', 699.99, '2025-03-27'),
    (3, 'John Doe', 'Tablet', 499.99, '2025-03-27');

-- Denormalization helps with performance for complex joins but increases redundancy.

-- 4. Indexes
-- Indexes are used to speed up the retrieval of data from a database by providing quick access to rows in a table.
-- They are especially useful for large tables.

-- 4.1 Create an Index
-- Example: Create an index on the 'customer_name' column in the 'orders' table to speed up searches by customer name.

CREATE INDEX idx_customer_name ON orders_normalized (customer_id);

-- 4.2 Using Indexes for Faster Searches
-- Now, searching by customer_id will be faster because of the index.

SELECT * FROM orders_normalized WHERE customer_id = 1;

-- 4.3 Removing an Index
-- If an index is no longer needed, you can drop it.

DROP INDEX idx_customer_name ON orders_normalized;

-- 5. Views
-- A view is a virtual table created by a query that selects data from one or more tables.
-- It simplifies complex queries and provides a layer of abstraction.

-- 5.1 Creating a View
-- Example: Create a view that combines customer and order details for easy access.

CREATE VIEW customer_orders AS
SELECT o.order_id, c.customer_name, p.product_name, o.order_date
FROM orders_normalized o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;

-- 5.2 Querying a View
-- You can query the view just like a regular table.

SELECT * FROM customer_orders;

-- 5.3 Dropping a View
-- If the view is no longer needed, you can drop it.

DROP VIEW customer_orders;

-- 6. Stored Procedures
-- A stored procedure is a set of SQL statements that can be stored and executed later. It is useful for encapsulating logic that is frequently used.

-- 6.1 Creating a Stored Procedure
-- Example: Create a stored procedure to insert a new customer into the 'customers' table.

DELIMITER $$

CREATE PROCEDURE add_customer(IN name VARCHAR(100))
BEGIN
    INSERT INTO customers (customer_name) VALUES (name);
END $$

DELIMITER ;

-- 6.2 Calling a Stored Procedure
-- Example: Call the stored procedure to add a new customer.

CALL add_customer('Michael Johnson');

-- 6.3 Altering a Stored Procedure
-- You can modify a stored procedure by dropping and recreating it.

DROP PROCEDURE IF EXISTS add_customer;

-- 6.4 Dropping a Stored Procedure
-- To remove a stored procedure, use the DROP PROCEDURE statement.

DROP PROCEDURE add_customer;

-- End of Advanced SQL Topics
