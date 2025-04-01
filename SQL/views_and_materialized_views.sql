-- ============================================
-- VIEWS & MATERIALIZED VIEWS IN SQL
-- ============================================

-- -------------------------------------------
-- 1️⃣ VIEWS: A Virtual Table
-- -------------------------------------------

-- A view is a stored query that can be treated like a table.
-- Views allow us to simplify complex queries and reuse them.
-- Views do not store data physically, they only store the query.

-- Creating a simple view:
CREATE VIEW employee_summary AS
SELECT id, first_name, last_name, department, salary
FROM employees
WHERE active = 1;

-- Query the view:
SELECT * FROM employee_summary;

-- -------------------------------------------
-- 2️⃣ Updating Data Through Views (Read-Only & Updatable Views)
-- -------------------------------------------

-- Some views are read-only and do not allow updates (especially when they have joins, aggregations, or group by clauses).
-- However, views that reference a single table and do not include any aggregate functions can be updatable.

-- Example of an updatable view (single table, no aggregation):
CREATE VIEW employee_salaries AS
SELECT id, first_name, last_name, salary FROM employees;

-- Updating data through the view:
UPDATE employee_salaries
SET salary = salary + 500
WHERE id = 101;

-- -------------------------------------------
-- 3️⃣ MATERIALIZED VIEWS: A Pre-Computed Query Result
-- -------------------------------------------

-- Unlike views, materialized views physically store data. They store the result of a query and can be refreshed periodically.
-- This is useful for performance, especially for expensive computations.

-- Creating a materialized view:
CREATE MATERIALIZED VIEW employee_sales_summary AS
SELECT department, SUM(sales_amount) AS total_sales
FROM sales
GROUP BY department;

-- Querying a materialized view:
SELECT * FROM employee_sales_summary;

-- -------------------------------------------
-- 4️⃣ Refreshing a Materialized View
-- -------------------------------------------

-- Materialized views need to be refreshed to reflect changes in the underlying tables.
-- By default, materialized views do not automatically update when the base data changes.

-- Manual refresh:
REFRESH MATERIALIZED VIEW employee_sales_summary;

-- You can schedule regular refreshes for materialized views in your database system.

-- Example of automatic refresh in PostgreSQL (setting a cron job or trigger):
-- CREATE EVENT TRIGGER refresh_view_trigger
-- ON EVENT 'your_event_name'
-- EXECUTE PROCEDURE refresh_employee_sales_summary();

-- -------------------------------------------
-- 5️⃣ Dropping Views and Materialized Views
-- -------------------------------------------

-- Dropping a view:
DROP VIEW employee_summary;

-- Dropping a materialized view:
DROP MATERIALIZED VIEW employee_sales_summary;

-- -------------------------------------------
-- 6️⃣ Advantages & Disadvantages of Views and Materialized Views
-- -------------------------------------------

-- Views:
-- ✔ No storage overhead, just a stored query
-- ✔ Always reflect the latest data
-- ✖ Can be slow for complex queries, especially if there are many joins or aggregations

-- Materialized Views:
-- ✔ Faster for repetitive, complex queries since the results are precomputed
-- ✔ Useful for reporting and business intelligence
-- ✖ Storage overhead as they store data physically
-- ✖ Must be refreshed periodically to reflect the latest data
