-- Basic SQL Queries

-- 1. SELECT Statement
-- The SELECT statement is used to retrieve data from a table.
-- Syntax: SELECT column1, column2, ... FROM table_name;

-- Example: Select all records from the 'employees' table
SELECT * FROM employees;

-- Example: Select only specific columns (first_name, last_name)
SELECT first_name, last_name FROM employees;

-- 2. WHERE Clause
-- The WHERE clause is used to filter records based on a condition.
-- Example: Select employees who are Software Engineers
SELECT * FROM employees
WHERE job_title = 'Software Engineer';

-- Example: Select employees with a salary greater than 100,000
SELECT first_name, last_name, salary FROM employees
WHERE salary > 100000;

-- 3. AND / OR Operators
-- Use AND to combine conditions, OR for alternative conditions.
-- Example: Select employees who are either 'Software Engineer' or 'Designer'
SELECT * FROM employees
WHERE job_title = 'Software Engineer' OR job_title = 'Designer';

-- Example: Select employees with a salary greater than 90,000 AND who are 'Software Engineers'
SELECT * FROM employees
WHERE job_title = 'Software Engineer' AND salary > 90000;

-- 4. ORDER BY Clause
-- The ORDER BY clause is used to sort results.
-- Syntax: SELECT column1, column2, ... FROM table_name ORDER BY column_name [ASC|DESC];

-- Example: Sort employees by last name in ascending order
SELECT first_name, last_name FROM employees
ORDER BY last_name ASC;

-- Example: Sort employees by salary in descending order
SELECT first_name, last_name, salary FROM employees
ORDER BY salary DESC;

-- 5. LIMIT Clause
-- The LIMIT clause limits the number of rows returned by a query.
-- Example: Get the first 5 employees from the table
SELECT * FROM employees
LIMIT 5;

-- 6. DISTINCT Keyword
-- The DISTINCT keyword removes duplicate values.
-- Example: Get all unique job titles from the 'employees' table
SELECT DISTINCT job_title FROM employees;

-- End of Basic SQL Queries
