-- Performance Tuning in SQL: Query Optimization Techniques and Using EXPLAIN Plans

-- 1. Introduction
-- Performance tuning involves optimizing SQL queries to reduce execution time.
-- We will cover query optimization techniques, how to use EXPLAIN plans to analyze queries, and common performance pitfalls.

-- 2. Query Optimization Techniques

-- 2.1 Select Only the Columns You Need
-- Selecting only the columns you need reduces the amount of data processed.
-- Avoid SELECT * and select specific columns.

-- Example: Bad Query (selecting all columns)
SELECT * FROM orders WHERE order_date = '2025-03-27';

-- Example: Optimized Query (selecting only necessary columns)
SELECT order_id, customer_id, product_id FROM orders WHERE order_date = '2025-03-27';

-- 2.2 Use WHERE Clauses Efficiently
-- Avoid using functions on indexed columns in WHERE clauses, as it can prevent the use of indexes.
-- Example: Avoiding functions on columns in WHERE clauses.

-- Bad Example (using a function in WHERE)
SELECT * FROM orders WHERE YEAR(order_date) = 2025;

-- Optimized Example (direct comparison)
SELECT * FROM orders WHERE order_date BETWEEN '2025-01-01' AND '2025-12-31';

-- 2.3 Use Indexes for Faster Searches
-- Indexes speed up query performance, especially for large tables with frequent searches.

-- Example: Adding an index on `order_date` to speed up queries filtering by order_date.
CREATE INDEX idx_order_date ON orders(order_date);

-- Example: Checking the query plan before and after adding an index
EXPLAIN SELECT order_id, customer_id FROM orders WHERE order_date = '2025-03-27';

-- 2.4 Avoid Using DISTINCT or GROUP BY Unnecessarily
-- `DISTINCT` and `GROUP BY` can be expensive operations, and they should be used when necessary.

-- Bad Example (unnecessary DISTINCT)
SELECT DISTINCT customer_id FROM orders WHERE order_date = '2025-03-27';

-- Optimized Example (no need for DISTINCT)
SELECT customer_id FROM orders WHERE order_date = '2025-03-27';

-- 2.5 Avoid N+1 Query Problem (One of the most common inefficiencies)
-- The N+1 problem occurs when you make a query inside a loop, leading to a large number of database queries.

-- Bad Example (N+1 problem with subquery)
SELECT customer_id, customer_name 
FROM customers 
WHERE customer_id IN (
  SELECT customer_id FROM orders WHERE order_date = '2025-03-27'
);

-- Optimized Example (Using JOIN to eliminate N+1 problem)
SELECT c.customer_id, c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_date = '2025-03-27';

-- 2.6 Limit the Use of Subqueries
-- Subqueries can often be replaced by JOINs, which are typically faster.

-- Bad Example (Subquery with `IN`)
SELECT customer_id
FROM customers
WHERE customer_id IN (
  SELECT customer_id FROM orders WHERE order_date = '2025-03-27'
);

-- Optimized Example (Replacing subquery with a JOIN)
SELECT DISTINCT c.customer_id
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_date = '2025-03-27';

-- 3. Using EXPLAIN Plans to Optimize Queries

-- EXPLAIN provides the execution plan for a query, showing how the database engine will execute the SQL.
-- It helps identify issues such as full table scans, missing indexes, and inefficient joins.

-- 3.1 Using EXPLAIN with SELECT Queries

-- Example: Using EXPLAIN to see how a SELECT query is executed.
EXPLAIN SELECT customer_id, order_id FROM orders WHERE order_date = '2025-03-27';

-- Output Explanation:
-- - `id`: The query ID (for subqueries and UNIONs).
-- - `select_type`: The type of SELECT (e.g., SIMPLE, UNION, SUBQUERY).
-- - `table`: The table being queried.
-- - `type`: The join type (e.g., ALL, index, ref).
-- - `key`: The index used (if any).
-- - `rows`: The estimated number of rows scanned.
-- - `Extra`: Extra information (e.g., using filesort, full table scan).

-- 3.2 Using EXPLAIN for Joins

-- Example: Using EXPLAIN with JOIN queries to see if indexes are being used efficiently.
EXPLAIN SELECT c.customer_id, c.customer_name, o.order_id
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_date = '2025-03-27';

-- Output Explanation:
-- You can see whether the join is using a "ref" or "eq_ref" type, which is efficient, or if it's doing a full table scan ("ALL").

-- 3.3 Using EXPLAIN for Subqueries
-- EXPLAIN helps identify performance issues with subqueries, such as full table scans or missing indexes.

-- Example: Using EXPLAIN to analyze a subquery.
EXPLAIN SELECT customer_id
FROM customers
WHERE customer_id IN (
  SELECT customer_id FROM orders WHERE order_date = '2025-03-27'
);

-- 3.4 Using EXPLAIN ANALYZE (MySQL 8.0+)
-- EXPLAIN ANALYZE provides a more detailed execution plan, including actual run-time statistics.

EXPLAIN ANALYZE SELECT customer_id, order_id FROM orders WHERE order_date = '2025-03-27';

-- This will provide real runtime information, such as actual rows scanned, execution time, and other performance metrics.

-- 4. Common EXPLAIN Output Issues and Optimization

-- 4.1 Full Table Scans
-- If EXPLAIN shows `ALL` under the `type` column, the query is performing a full table scan. This happens when there's no index.
-- To resolve this, ensure you're using indexes on the columns that are part of the WHERE clause.

-- Example: Creating an index on `customer_id` to avoid full table scan.
CREATE INDEX idx_customer_id ON orders(customer_id);

-- Example: Checking EXPLAIN after adding the index.
EXPLAIN SELECT customer_id, order_id FROM orders WHERE customer_id = 101;

-- 4.2 Using `ALL` in EXPLAIN
-- `ALL` in the EXPLAIN output indicates a full table scan. Adding an index on the queried column can optimize the query.

-- Example: Using an index on `order_date` to optimize full table scans.
CREATE INDEX idx_order_date ON orders(order_date);

-- Example: EXPLAIN output after adding index.
EXPLAIN SELECT order_id, product_id FROM orders WHERE order_date = '2025-03-27';

-- 4.3 Using `index` or `range` in EXPLAIN
-- When EXPLAIN shows `index` or `range`, it means the query is using an index efficiently. This is optimal for performance.

-- Example: Query that uses an index efficiently
EXPLAIN SELECT customer_id, order_id FROM orders WHERE order_date BETWEEN '2025-01-01' AND '2025-12-31';

-- 4.4 Using `filesort` or `temporary` in EXPLAIN
-- `filesort` indicates that MySQL is performing an additional sorting operation.
-- `temporary` indicates that MySQL is using a temporary table to store intermediate results.
-- Both operations can degrade performance, especially on large datasets.

-- Example: Optimizing queries to avoid `filesort`.
SELECT customer_id, order_id FROM orders ORDER BY order_date;

-- If EXPLAIN shows `filesort`, consider adding an index on `order_date`.

-- 5. Optimizing Specific Query Types

-- 5.1 Optimizing JOIN Queries
-- When joining multiple tables, ensure the following:
--   - Use indexed columns for joins (typically primary keys and foreign keys).
--   - Use `INNER JOIN` rather than `LEFT JOIN` unless necessary.
--   - Avoid unnecessary joins in your queries.

-- Example: Using INNER JOIN with indexed columns.
EXPLAIN SELECT o.order_id, c.customer_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_date = '2025-03-27';

-- Example: Using LEFT JOIN only when required.
EXPLAIN SELECT c.customer_name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_date = '2025-03-27';

-- 5.2 Optimizing GROUP BY Queries
-- When using `GROUP BY`, ensure that you have an index on the columns you're grouping by, especially for large datasets.

-- Example: GROUP BY without index (may be slow)
EXPLAIN SELECT customer_id, COUNT(order_id)
FROM orders
GROUP BY customer_id;

-- Optimized Example: Add an index on `customer_id` to speed up the `GROUP BY` operation.
CREATE INDEX idx_customer_id ON orders(customer_id);

-- After adding the index, EXPLAIN should show that the query uses the index for faster grouping.

-- 5.3 Optimizing ORDER BY Queries
-- `ORDER BY` operations can be slow without an index. Make sure to index columns that are used for sorting.

-- Example: Slow ORDER BY query (without index)
EXPLAIN SELECT order_id, product_id FROM orders ORDER BY order_date;

-- Optimized Example: Add an index on `order_date` for faster sorting.
CREATE INDEX idx_order_date ON orders(order_date);

-- After adding the index, EXPLAIN should show that sorting is done efficiently using the index.

-- End of Performance Tuning SQL
