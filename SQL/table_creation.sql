-- Table Creation in SQL

-- 1. Introduction
-- In SQL, you can create custom tables using the CREATE TABLE statement.
-- You define columns, their data types, and any constraints for the table.

-- 2. Basic Table Creation
-- Syntax: CREATE TABLE table_name (
--   column1 datatype,
--   column2 datatype,
--   ...
-- );

-- Example: Create a simple 'employees' table with basic columns
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,     -- employee_id is an integer and the primary key
    first_name VARCHAR(50),          -- first_name is a variable character string of length 50
    last_name VARCHAR(50),           -- last_name is also a variable character string
    job_title VARCHAR(100),          -- job_title is a variable character string
    salary DECIMAL(10, 2)            -- salary is a decimal number with up to 10 digits, 2 after the decimal point
);

-- 3. Create a 'departments' table
-- Example: Create a table to store department information
CREATE TABLE departments (
    department_id INT PRIMARY KEY,   -- department_id is an integer and the primary key
    department_name VARCHAR(100),    -- department_name is a variable character string
    location VARCHAR(100)            -- location is a variable character string
);

-- 4. Foreign Keys
-- A Foreign Key is a column that creates a link between two tables.
-- It refers to the primary key in another table, creating a relationship between the tables.
-- Syntax: FOREIGN KEY (column_name) REFERENCES other_table(primary_key_column);

-- Example: Add a foreign key to 'employees' table to link it to the 'departments' table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,       -- primary key
    first_name VARCHAR(50),            
    last_name VARCHAR(50),             
    job_title VARCHAR(100),            
    salary DECIMAL(10, 2),             
    department_id INT,                 -- department_id is the foreign key
    FOREIGN KEY (department_id) REFERENCES departments(department_id)   -- link to departments table
);

-- 5. Creating a 'projects' table with a many-to-many relationship
-- A many-to-many relationship involves a third table, often called a junction table.
-- This table contains foreign keys from both tables involved in the relationship.

-- Example: Create a 'projects' table
CREATE TABLE projects (
    project_id INT PRIMARY KEY,       -- project_id is an integer and primary key
    project_name VARCHAR(100),        -- project_name is a variable character string
    budget DECIMAL(15, 2)             -- budget is a decimal value for the project's budget
);

-- Example: Create a junction table for employees and projects to establish a many-to-many relationship
CREATE TABLE employee_projects (
    employee_id INT,                  -- employee_id is a foreign key
    project_id INT,                    -- project_id is a foreign key
    hours_worked DECIMAL(10, 2),       -- hours_worked is a decimal value
    PRIMARY KEY (employee_id, project_id),  -- composite primary key (both columns together)
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),  -- foreign key to employees table
    FOREIGN KEY (project_id) REFERENCES projects(project_id)     -- foreign key to projects table
);

-- 6. Altering a Table
-- Sometimes you may need to modify an existing table, for example adding a new column or changing data types.

-- Example: Add a new 'email' column to the 'employees' table
ALTER TABLE employees
ADD email VARCHAR(100);

-- Example: Change the data type of the 'salary' column in 'employees' table
ALTER TABLE employees
MODIFY salary DECIMAL(15, 2);

-- Example: Drop a column from the 'employees' table
ALTER TABLE employees
DROP COLUMN email;

-- 7. Dropping a Table
-- You can remove a table entirely using the DROP TABLE statement. This deletes both the structure and the data.

-- Example: Drop the 'projects' table
DROP TABLE projects;

-- End of Table Creation SQL
