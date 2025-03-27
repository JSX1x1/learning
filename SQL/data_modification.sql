-- SQL Data Modification: INSERT, UPDATE, DELETE, and Transactions (COMMIT, ROLLBACK)

-- 1. Introduction to Data Modification
-- Data modification is an essential part of working with SQL databases.
-- The main operations for modifying data include:
--    - INSERT: Add new data to the table.
--    - UPDATE: Modify existing data.
--    - DELETE: Remove data from the table.
--    - Transactions: Group multiple data modification operations into a single unit, allowing for COMMIT and ROLLBACK.

-- 2. INSERT INTO: Adding New Data

-- 2.1 Basic INSERT Statement
-- To add a new row of data into a table, use the `INSERT INTO` statement.

-- Example: Insert a new record into the `customers` table
INSERT INTO customers (customer_id, customer_name, email)
VALUES (101, 'John Doe', 'john.doe@example.com');

-- Example: Insert multiple records in a single query
INSERT INTO customers (customer_id, customer_name, email)
VALUES 
  (102, 'Jane Smith', 'jane.smith@example.com'),
  (103, 'Samuel Clark', 'samuel.clark@example.com');

-- 2.2 INSERT with Default Values
-- If a column has a default value set, you can skip specifying the value for that column.

-- Example: Insert a new record, where `join_date` will use the default value
INSERT INTO customers (customer_id, customer_name, email)
VALUES (104, 'Lucy Brown', 'lucy.brown@example.com');

-- 3. UPDATE: Modifying Existing Data

-- 3.1 Basic UPDATE Statement
-- To modify existing data in a table, use the `UPDATE` statement.

-- Example: Update an email address for a specific customer
UPDATE customers
SET email = 'john.doe2025@example.com'
WHERE customer_id = 101;

-- Example: Update multiple columns in a single update query
UPDATE customers
SET customer_name = 'Johnathan Doe', email = 'johnathan.doe@example.com'
WHERE customer_id = 101;

-- 3.2 Conditional UPDATE
-- Use the `WHERE` clause to ensure that only the specific rows you want to modify are affected.

-- Example: Update only customers from a specific city
UPDATE customers
SET city = 'New York'
WHERE customer_id = 102;

-- 3.3 Update with Subqueries
-- You can also use subqueries within an UPDATE statement to dynamically change values based on another table.

-- Example: Update the price of a product based on a discount stored in the `discounts` table
UPDATE products
SET price = price * (1 - (SELECT discount_percentage FROM discounts WHERE discount_id = 1))
WHERE product_id = 1001;

-- 4. DELETE: Removing Data

-- 4.1 Basic DELETE Statement
-- The `DELETE` statement is used to remove data from a table.

-- Example: Delete a record from the `customers` table
DELETE FROM customers
WHERE customer_id = 104;

-- Example: Delete all records from a table (be careful with this!)
DELETE FROM customers;

-- 4.2 DELETE with JOIN
-- You can delete rows from a table based on matching values in another table using a `JOIN`.

-- Example: Delete all orders made by a specific customer
DELETE o
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_name = 'Johnathan Doe';

-- 5. Transactions: COMMIT and ROLLBACK

-- 5.1 Introduction to Transactions
-- A transaction allows you to group multiple SQL statements into a single unit of work.
-- You can either commit (save) all changes made in the transaction or roll back (undo) the changes if something goes wrong.

-- 5.2 Starting a Transaction
-- To begin a transaction, use the `START TRANSACTION` or `BEGIN` command.
-- In some SQL dialects, you may use `BEGIN TRANSACTION`.

-- Example: Starting a transaction
START TRANSACTION;

-- Example: Insert, update, and delete operations within a transaction
-- Insert new customer record
INSERT INTO customers (customer_id, customer_name, email) 
VALUES (105, 'Eve Black', 'eve.black@example.com');

-- Update an existing customer's email
UPDATE customers
SET email = 'eve.black2025@example.com'
WHERE customer_id = 105;

-- Delete a customer based on their ID
DELETE FROM customers
WHERE customer_id = 105;

-- 5.3 COMMIT: Save Changes
-- Once you've confirmed that all the operations in the transaction are correct, use the `COMMIT` statement to save the changes to the database.

-- Example: Commit the changes
COMMIT;

-- 5.4 ROLLBACK: Undo Changes
-- If something goes wrong within a transaction, you can roll back all changes made during the transaction to revert to the previous state.

-- Example: Rollback if an error occurs (this example assumes you have some error condition checking in your application)
ROLLBACK;

-- 5.5 Using Transactions with Error Handling
-- Transactions are often used with error handling to ensure that if one operation fails, all operations are undone.

-- Example: Begin a transaction, make changes, then commit if successful or rollback on failure
START TRANSACTION;

-- Insert a new customer
INSERT INTO customers (customer_id, customer_name, email)
VALUES (106, 'George White', 'george.white@example.com');

-- Simulate an error by updating with a wrong condition
UPDATE customers
SET email = 'george.white2025@example.com'
WHERE customer_id = 999;  -- This will not find any rows

-- Check if an error occurs (you'd typically do this in application logic)
-- If error occurs:
-- ROLLBACK;
-- Otherwise, COMMIT;
-- For illustration, let's assume no error, so commit:
COMMIT;

-- 6. Common Pitfalls and Best Practices

-- 6.1 DELETE with Caution
-- When using DELETE, always ensure you have a `WHERE` clause. Without it, the entire table can be deleted.

-- Example: Without WHERE clause, it will delete all rows
-- DELETE FROM customers; -- Be cautious!

-- 6.2 Using Transactions to Ensure Consistency
-- Always group related operations into a transaction to maintain data consistency.
-- Example: Moving money between two accounts would require updating both accounts in one transaction.

-- Example: Transaction to transfer funds from one account to another
START TRANSACTION;

-- Withdraw money from account A
UPDATE accounts
SET balance = balance - 100
WHERE account_id = 1;

-- Deposit money into account B
UPDATE accounts
SET balance = balance + 100
WHERE account_id = 2;

-- Check for errors (e.g., insufficient funds), and commit/rollback accordingly
-- If no errors:
COMMIT;
-- If there's an error (e.g., insufficient funds), ROLLBACK;

-- 7. Conclusion
-- Data modification operations such as `INSERT`, `UPDATE`, and `DELETE` allow you to manage data in your database.
-- Transactions provide a way to ensure that multiple changes are grouped together and either fully committed or fully rolled back.
-- Always use transactions when performing operations that need to be atomic and consistent, especially for critical applications like banking or e-commerce systems.