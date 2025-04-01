-- ===========================================
-- 1. Create Sample Database and Table
-- ===========================================

CREATE DATABASE IndexOptimizationDB;
USE IndexOptimizationDB;

CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Department VARCHAR(100),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

-- Insert sample data
INSERT INTO Employees (FirstName, LastName, Department, Salary, HireDate)
VALUES 
('John', 'Doe', 'IT', 50000, '2015-03-12'),
('Jane', 'Smith', 'HR', 55000, '2016-06-22'),
('Emily', 'Johnson', 'IT', 60000, '2018-01-09'),
('Michael', 'Williams', 'Finance', 70000, '2017-02-15'),
('Sarah', 'Brown', 'IT', 45000, '2019-08-01'),
('David', 'Davis', 'HR', 60000, '2020-05-03');

-- ===========================================
-- 2. Basic Index Creation (On a Single Column)
-- ===========================================

-- Create a non-clustered index on the "LastName" column
CREATE NONCLUSTERED INDEX idx_lastname ON Employees (LastName);

-- ===========================================
-- 3. Composite Index for Multiple Columns
-- ===========================================

-- Create a composite non-clustered index on "Department" and "Salary"
CREATE NONCLUSTERED INDEX idx_dept_salary ON Employees (Department, Salary);

-- ===========================================
-- 4. Unique Index for Enforcing Uniqueness
-- ===========================================

-- Create a unique index to ensure no duplicate FirstName + LastName
CREATE UNIQUE NONCLUSTERED INDEX idx_unique_name ON Employees (FirstName, LastName);

-- ===========================================
-- 5. Filtered Index for Better Query Performance
-- ===========================================

-- Create a filtered index to optimize queries for employees in the IT department
CREATE NONCLUSTERED INDEX idx_it_dept ON Employees (FirstName, LastName)
WHERE Department = 'IT';

-- ===========================================
-- 6. Full-Text Index for Text Search
-- ===========================================

-- Ensure full-text indexing is enabled for the database (this requires SQL Server Full-Text Search feature)
-- Enabling Full-Text Indexing (if not already done)
-- CREATE FULLTEXT CATALOG ft_catalog AS DEFAULT;
-- CREATE FULLTEXT INDEX ON Employees(FirstName, LastName) KEY INDEX PK__Employees__0000000000000000;

-- Example full-text search (assuming full-text index is created)
-- SELECT * FROM Employees WHERE CONTAINS(FirstName, 'John');

-- ===========================================
-- 7. Drop Unused Indexes
-- ===========================================

-- If an index is no longer being used or has a negative impact on performance (due to extra overhead during inserts/updates),
-- you can drop the index to optimize the database performance.
DROP INDEX idx_lastname ON Employees;

-- ===========================================
-- 8. Rebuilding and Reorganizing Indexes
-- ===========================================

-- Rebuilding an index (for large tables or if an index has fragmented)
-- This operation drops and recreates the index, so it's more resource-intensive but can significantly improve performance.
ALTER INDEX idx_dept_salary ON Employees REBUILD;

-- Reorganizing an index (a lighter operation, ideal for slightly fragmented indexes)
ALTER INDEX idx_dept_salary ON Employees REORGANIZE;

-- ===========================================
-- 9. Indexing Best Practices
-- ===========================================

-- 1. Use clustered indexes only when there's a need for sorted data or for the primary key (by default).
-- 2. Use non-clustered indexes for frequently queried columns that are not part of the primary key.
-- 3. Use composite indexes for queries that filter or sort based on multiple columns.
-- 4. Consider filtered indexes when a subset of data is queried frequently.
-- 5. Monitor index fragmentation and rebuild/reorganize indexes as needed.
-- 6. Avoid creating indexes on columns that are rarely queried.
-- 7. Regularly analyze query execution plans to identify missing indexes.

-- ===========================================
-- 10. View Query Plan and Index Usage
-- ===========================================

-- Check the query execution plan to analyze whether the index is being used
-- You can use "SET SHOWPLAN_ALL" to view the plan for a query, or use the "Execution Plan" tab in SQL Server Management Studio.
-- Example:
-- SET SHOWPLAN_ALL ON;
-- SELECT * FROM Employees WHERE Department = 'IT';

-- ===========================================
-- 11. Analyze and Maintain Index Usage
-- ===========================================

-- You can use the dynamic management views (DMVs) to monitor the index usage and find unused or underutilized indexes.
SELECT 
    ix.name AS IndexName,
    OBJECT_NAME(ix.object_id) AS TableName,
    ix.type_desc AS IndexType,
    ix.is_disabled,
    ix.is_unique,
    SUM(ips.user_seeks + ips.user_scans + ips.user_lookups + ips.user_updates) AS TotalAccesses
FROM 
    sys.indexes AS ix
JOIN 
    sys.dm_db_index_usage_stats AS ips 
    ON ix.object_id = ips.object_id AND ix.index_id = ips.index_id
WHERE 
    OBJECTPROPERTY(ix.object_id, 'IsUserTable') = 1
GROUP BY 
    ix.name, ix.object_id, ix.type_desc, ix.is_disabled, ix.is_unique
ORDER BY 
    TotalAccesses DESC;

-- ===========================================
-- 12. Index Fragmentation (and when to rebuild)
-- ===========================================

-- Check index fragmentation to see if any indexes need to be rebuilt or reorganized.
-- Fragmentation percentage above 30% usually suggests that you should rebuild the index.

SELECT 
    OBJECT_NAME(IXOS.OBJECT_ID) AS TableName,
    IX.name AS IndexName,
    IX.type_desc AS IndexType,
    IXOS.LEAF_INSERT_COUNT + IXOS.LEAF_UPDATE_COUNT + IXOS.LEAF_DELETE_COUNT AS Fragmentation
FROM 
    SYS.DM_DB_INDEX_OPERATIONAL_STATS(NULL, NULL, NULL, NULL) IXOS
INNER JOIN 
    SYS.INDEXES IX 
    ON IX.OBJECT_ID = IXOS.OBJECT_ID AND IX.INDEX_ID = IXOS.INDEX_ID
WHERE 
    OBJECTPROPERTY(IX.OBJECT_ID,'IsUserTable') = 1
ORDER BY 
    Fragmentation DESC;

