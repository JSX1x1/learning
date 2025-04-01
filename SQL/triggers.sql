-- ===========================================
-- Trigger for auditing insert operations
-- ===========================================

-- Create a table for storing audit logs
CREATE TABLE AuditLogs (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    TableName VARCHAR(255),
    Operation VARCHAR(50),
    ColumnName VARCHAR(255),
    OldValue VARCHAR(255),
    NewValue VARCHAR(255),
    ChangeDate DATETIME DEFAULT GETDATE()
);

-- Create trigger to log insert operations
CREATE TRIGGER trg_AuditInsert
ON Employees
FOR INSERT
AS
BEGIN
    DECLARE @NewValue VARCHAR(255);
    SELECT @NewValue = Name FROM inserted;

    -- Insert an entry into the AuditLogs table for the insert operation
    INSERT INTO AuditLogs (TableName, Operation, ColumnName, NewValue)
    VALUES ('Employees', 'INSERT', 'Name', @NewValue);
END;

-- ===========================================
-- Trigger for auditing update operations
-- ===========================================

-- Create trigger to log update operations
CREATE TRIGGER trg_AuditUpdate
ON Employees
FOR UPDATE
AS
BEGIN
    DECLARE @OldValue VARCHAR(255), @NewValue VARCHAR(255);
    SELECT @OldValue = Name FROM deleted;
    SELECT @NewValue = Name FROM inserted;

    -- Insert an entry into the AuditLogs table for the update operation
    INSERT INTO AuditLogs (TableName, Operation, ColumnName, OldValue, NewValue)
    VALUES ('Employees', 'UPDATE', 'Name', @OldValue, @NewValue);
END;

-- ===========================================
-- Trigger for auditing delete operations
-- ===========================================

-- Create trigger to log delete operations
CREATE TRIGGER trg_AuditDelete
ON Employees
FOR DELETE
AS
BEGIN
    DECLARE @OldValue VARCHAR(255);
    SELECT @OldValue = Name FROM deleted;

    -- Insert an entry into the AuditLogs table for the delete operation
    INSERT INTO AuditLogs (TableName, Operation, ColumnName, OldValue)
    VALUES ('Employees', 'DELETE', 'Name', @OldValue);
END;

-- ===========================================
-- Example to test triggers
-- ===========================================

-- Insert a record (should trigger the INSERT trigger)
INSERT INTO Employees (Name, Position) VALUES ('John Doe', 'Manager');

-- Update a record (should trigger the UPDATE trigger)
UPDATE Employees SET Name = 'Jane Doe' WHERE Name = 'John Doe';

-- Delete a record (should trigger the DELETE trigger)
DELETE FROM Employees WHERE Name = 'Jane Doe';

-- ===========================================
-- Show audit logs
-- ===========================================
SELECT * FROM AuditLogs;
