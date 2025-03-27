-- SQL Aggregation Functions: COUNT(), SUM(), AVG(), MIN(), MAX(), GROUP BY, HAVING

-- 1. Introduction to Aggregation Functions
-- SQL Aggregation functions allow you to perform calculations on data, such as:
--    - COUNT: Counts the number of rows or non-NULL values.
--    - SUM: Calculates the sum of numeric values.
--    - AVG: Calculates the average of numeric values.
--    - MIN: Returns the minimum value.
--    - MAX: Returns the maximum value.
-- Aggregation functions are typically used with the `GROUP BY` clause to perform calculations on subsets of data.

-- 2. COUNT() - Count Rows or Non-NULL Values

-- 2.1 COUNT() with a Single Column
-- Example: Count the number of rows in the `orders` table.
SELECT COUNT(*) AS total_orders
FROM orders;

-- Example: Count the number of non-NULL customer IDs in the `orders` table.
SELECT COUNT(customer_id) AS total_customers_with_orders
FROM orders;

-- 2.2 COUNT() with GROUP BY
-- Example: Count the number of orders for each customer.
SELECT customer_id, COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id;

-- 3. SUM() - Sum of Numeric Values

-- 3.1 SUM() Example
-- Example: Calculate the total value of all orders in the `orders` table.
SELECT SUM(order_total) AS total_order_value
FROM orders;

-- Example: Calculate the total value of orders for each customer.
SELECT customer_id, SUM(order_total) AS total_order_value
FROM orders
GROUP BY customer_id;

-- 3.2 SUM() with Conditional Filters
-- Example: Calculate the total value of orders that have been shipped (assuming `status` column exists).
SELECT SUM(order_total) AS total_shipped_value
FROM orders
WHERE order_status = 'Shipped';

-- 4. AVG() - Average of Numeric Values

-- 4.1 AVG() Example
-- Example: Calculate the average order total in the `orders` table.
SELECT AVG(order_total) AS average_order_value
FROM orders;

-- Example: Calculate the average order total for each customer.
SELECT customer_id, AVG(order_total) AS average_order_value
FROM orders
GROUP BY customer_id;

-- 4.2 AVG() with Conditional Filters
-- Example: Calculate the average order total for orders with status 'Shipped'.
SELECT AVG(order_total) AS average_shipped_order_value
FROM orders
WHERE order_status = 'Shipped';

-- 5. MIN() - Minimum Value

-- 5.1 MIN() Example
-- Example: Find the minimum order total in the `orders` table.
SELECT MIN(order_total) AS lowest_order_value
FROM orders;

-- Example: Find the minimum order total for each customer.
SELECT customer_id, MIN(order_total) AS lowest_order_value
FROM orders
GROUP BY customer_id;

-- 5.2 MIN() with Conditional Filters
-- Example: Find the minimum order total for orders that have been shipped.
SELECT MIN(order_total) AS lowest_shipped_order_value
FROM orders
WHERE order_status = 'Shipped';

-- 6. MAX() - Maximum Value

-- 6.1 MAX() Example
-- Example: Find the maximum order total in the `orders` table.
SELECT MAX(order_total) AS highest_order_value
FROM orders;

-- Example: Find the maximum order total for each customer.
SELECT customer_id, MAX(order_total) AS highest_order_value
FROM orders
GROUP BY customer_id;

-- 6.2 MAX() with Conditional Filters
-- Example: Find the maximum order total for orders that have been shipped.
SELECT MAX(order_total) AS highest_shipped_order_value
FROM orders
WHERE order_status = 'Shipped';

-- 7. GROUP BY - Grouping Results

-- 7.1 GROUP BY Example
-- The `GROUP BY` clause is used to group rows that have the same values in specified columns into summary rows.
-- Example: Calculate the total number of orders and total order value for each customer.
SELECT customer_id, COUNT(order_id) AS order_count, SUM(order_total) AS total_order_value
FROM orders
GROUP BY customer_id;

-- 7.2 GROUP BY with Multiple Columns
-- You can group by multiple columns to create subgroups.
-- Example: Group orders by both customer_id and order_status.
SELECT customer_id, order_status, COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id, order_status;

-- 8. HAVING - Filtering Aggregated Results

-- 8.1 Introduction to HAVING
-- The `HAVING` clause is used to filter the results of a `GROUP BY` query based on aggregate values.
-- `HAVING` works similar to `WHERE`, but `WHERE` is used to filter individual rows before aggregation, while `HAVING` filters groups after aggregation.

-- Example: Find customers with more than 5 orders.
SELECT customer_id, COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 5;

-- Example: Find customers whose total order value exceeds $5000.
SELECT customer_id, SUM(order_total) AS total_order_value
FROM orders
GROUP BY customer_id
HAVING SUM(order_total) > 5000;

-- 8.2 HAVING with Multiple Conditions
-- You can use multiple conditions with `HAVING` to filter the results.
-- Example: Find customers with more than 5 orders and whose average order value exceeds $500.
SELECT customer_id, COUNT(order_id) AS order_count, AVG(order_total) AS average_order_value
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 5 AND AVG(order_total) > 500;

-- 9. Combining Aggregation Functions with Sorting

-- 9.1 Sorting Aggregated Results
-- You can use the `ORDER BY` clause to sort aggregated results.
-- Example: Find the top 5 customers by total order value.
SELECT customer_id, SUM(order_total) AS total_order_value
FROM orders
GROUP BY customer_id
ORDER BY total_order_value DESC
LIMIT 5;

-- Example: Find the lowest 3 order totals.
SELECT order_id, order_total
FROM orders
ORDER BY order_total ASC
LIMIT 3;

-- 10. Conclusion
-- Aggregation functions are powerful tools in SQL that allow you to perform calculations on data, such as counting rows, summing values, calculating averages, and finding the minimum or maximum values.
-- The `GROUP BY` clause is used to group data, and the `HAVING` clause helps filter the results after aggregation.
-- Always use aggregation functions in combination with `GROUP BY` and `HAVING` to analyze data effectively.