-- SQL Joins

-- 1. Introduction to Joins
-- Joins allow you to combine rows from two or more tables based on a related column.

-- Example: Employees and departments tables
-- 'employees' table has a 'department_id' column
-- 'departments' table has a 'department_id' column

-- 2. INNER JOIN
-- The INNER JOIN returns only the rows that have matching values in both tables.
-- Syntax: SELECT columns FROM table1 INNER JOIN table2 ON table1.column = table2.column;

-- Example: Get employee names along with their department names using INNER JOIN
SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id;

-- 3. LEFT JOIN (or LEFT OUTER JOIN)
-- The LEFT JOIN returns all records from the left table (employees), and matched records from the right table (departments).
-- If no match is found, NULL values will be returned for columns from the right table.
-- Syntax: SELECT columns FROM table1 LEFT JOIN table2 ON table1.column = table2.column;

-- Example: Get all employees and their departments, including employees without a department (NULL in department_name)
SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
LEFT JOIN departments ON employees.department_id = departments.department_id;

-- 4. RIGHT JOIN (or RIGHT OUTER JOIN)
-- The RIGHT JOIN returns all records from the right table (departments), and matched records from the left table (employees).
-- If no match is found, NULL values will be returned for columns from the left table.
-- Syntax: SELECT columns FROM table1 RIGHT JOIN table2 ON table1.column = table2.column;

-- Example: Get all departments and their employees, including departments with no employees
SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
RIGHT JOIN departments ON employees.department_id = departments.department_id;

-- 5. FULL OUTER JOIN
-- The FULL OUTER JOIN returns all records when there is a match in either left (employees) or right (departments) table.
-- Syntax: SELECT columns FROM table1 FULL OUTER JOIN table2 ON table1.column = table2.column;

-- Example: Get all employees and departments, including employees with no department and departments with no employees
SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
FULL OUTER JOIN departments ON employees.department_id = departments.department_id;

-- 6. Using Aliases
-- Aliases are used to assign temporary names to tables or columns.
-- Syntax: SELECT column AS alias_name FROM table AS alias_name;

-- Example: Use aliases to simplify table and column names
SELECT e.first_name, e.last_name, d.department_name
FROM employees AS e
INNER JOIN departments AS d ON e.department_id = d.department_id;

-- End of SQL Joins
