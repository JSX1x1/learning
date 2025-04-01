-- ===========================================
-- 1. Create a table for Users
-- ===========================================

CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    DateCreated DATETIME DEFAULT GETDATE()
);

-- ===========================================
-- 2. Create a table for Audit Logs
-- ===========================================

CREATE TABLE AuditLogs (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    TableName VARCHAR(255),
    Operation VARCHAR(50),
    ColumnName VARCHAR(255),
    OldValue VARCHAR(255),
    NewValue VARCHAR(255),
    ChangeDate DATETIME DEFAULT GETDATE()
);

-- ===========================================
-- 3. Stored Procedure to Add a User
-- ===========================================

CREATE PROCEDURE AddUser
    @Username VARCHAR(255),
    @Password VARCHAR(255),
    @Email VARCHAR(255)
AS
BEGIN
    -- Insert the new user into the Users table
    INSERT INTO Users (Username, Password, Email)
    VALUES (@Username, @Password, @Email);

    -- Log this operation in the AuditLogs table
    INSERT INTO AuditLogs (TableName, Operation, ColumnName, NewValue)
    VALUES ('Users', 'INSERT', 'Username', @Username);
END;

-- ===========================================
-- 4. Stored Procedure to Update User Email
-- ===========================================

CREATE PROCEDURE UpdateUserEmail
    @UserID INT,
    @NewEmail VARCHAR(255)
AS
BEGIN
    DECLARE @OldEmail VARCHAR(255);

    -- Get the old email before update
    SELECT @OldEmail = Email FROM Users WHERE UserID = @UserID;

    -- Update the email for the user
    UPDATE Users
    SET Email = @NewEmail
    WHERE UserID = @UserID;

    -- Log this operation in the AuditLogs table
    INSERT INTO AuditLogs (TableName, Operation, ColumnName, OldValue, NewValue)
    VALUES ('Users', 'UPDATE', 'Email', @OldEmail, @NewEmail);
END;

-- ===========================================
-- 5. Stored Procedure to Delete a User
-- ===========================================

CREATE PROCEDURE DeleteUser
    @UserID INT
AS
BEGIN
    DECLARE @Username VARCHAR(255), @Email VARCHAR(255);

    -- Get user details before delete
    SELECT @Username = Username, @Email = Email FROM Users WHERE UserID = @UserID;

    -- Delete the user from the Users table
    DELETE FROM Users WHERE UserID = @UserID;

    -- Log this operation in the AuditLogs table
    INSERT INTO AuditLogs (TableName, Operation, ColumnName, OldValue, NewValue)
    VALUES ('Users', 'DELETE', 'Username', @Username, 'Deleted');
    INSERT INTO AuditLogs (TableName, Operation, ColumnName, OldValue, NewValue)
    VALUES ('Users', 'DELETE', 'Email', @Email, 'Deleted');
END;

-- ===========================================
-- 6. Execute the Stored Procedures
-- ===========================================

-- Add a new user
EXEC AddUser @Username = 'john_doe', @Password = 'password123', @Email = 'john.doe@example.com';

-- Update the email of an existing user
EXEC UpdateUserEmail @UserID = 1, @NewEmail = 'john.doe@newdomain.com';

-- Delete a user
EXEC DeleteUser @UserID = 1;

-- ===========================================
-- 7. View the Audit Logs to check all changes
-- ===========================================
SELECT * FROM AuditLogs;
