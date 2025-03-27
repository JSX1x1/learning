-- Web Integration with SQL - Backend Database Integration for Websites

-- 1. Introduction to Web Backend Integration
-- Websites and web applications commonly use SQL databases to store and retrieve data.
-- This file demonstrates SQL queries and table structures commonly used in web development.

-- Example Use Case: Build a user registration and login system with SQL backend.

-- 2. Creating Tables for User Authentication
-- A basic web application needs a table to store user information, such as usernames, passwords, and emails.
-- We'll also set up a table for user roles (e.g., admin, user, guest).

-- Create a table for users
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,      -- Automatically incrementing primary key
    username VARCHAR(50) NOT NULL UNIQUE,        -- Unique username, cannot be null
    password_hash VARCHAR(255) NOT NULL,         -- Store hashed password for security
    email VARCHAR(100) NOT NULL UNIQUE,          -- Unique email, cannot be null
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Auto-populate with the current timestamp
    role VARCHAR(20) DEFAULT 'user'              -- Default role is 'user'
);

-- Create a table for user roles (optional if more roles are required)
CREATE TABLE roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) NOT NULL UNIQUE        -- Store unique role names (e.g., admin, user)
);

-- 3. Inserting Users into the Database
-- In a real web application, the user would sign up via a form, and the data would be inserted into the database.

-- Example: Insert a user into the 'users' table (hash password for security in real applications)
INSERT INTO users (username, password_hash, email, role)
VALUES ('john_doe', 'hashed_password_example', 'john.doe@example.com', 'user');

-- 4. Querying Data for User Authentication (Login)
-- The web application will query the database to verify the user's login credentials.

-- Example: Find a user by username to validate login
SELECT * FROM users
WHERE username = 'john_doe';

-- Example: Validate if the password matches (in a real application, compare hashed passwords)
SELECT * FROM users
WHERE username = 'john_doe' AND password_hash = 'hashed_password_example';

-- 5. Password Security and Hashing
-- Never store plain text passwords in the database. Always store a hashed version of the password.
-- This example assumes you have a mechanism (like bcrypt or Argon2) in your backend to hash passwords.

-- Example: The password is hashed and verified using a backend application, not in SQL directly.
-- INSERT a user with a hashed password (this should be done in the backend before inserting).

-- 6. Updating User Information
-- Web applications often allow users to update their account information, such as email or password.

-- Example: Update the user's email address
UPDATE users
SET email = 'new.email@example.com'
WHERE user_id = 1;

-- Example: Change a user's password (in a real app, the password should be hashed before updating)
UPDATE users
SET password_hash = 'new_hashed_password'
WHERE user_id = 1;

-- 7. Deleting User Accounts
-- Sometimes users may want to delete their accounts, or an administrator may remove a user.

-- Example: Delete a user by username
DELETE FROM users
WHERE username = 'john_doe';

-- 8. Tracking User Sessions (Optional)
-- Many web applications need to track user sessions for activities such as login/logout.
-- A table for tracking sessions could store session information, such as session tokens or expiration dates.

-- Create a table to store user sessions (for example, when users log in or log out)
CREATE TABLE user_sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,    -- Session ID (Primary Key)
    user_id INT,                                  -- The ID of the user
    session_token VARCHAR(255) NOT NULL,           -- Unique session token
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp when session was created
    expires_at TIMESTAMP,                         -- Timestamp when session expires
    FOREIGN KEY (user_id) REFERENCES users(user_id)  -- Foreign key to the users table
);

-- Example: Insert a session record when a user logs in (backend will generate session_token)
INSERT INTO user_sessions (user_id, session_token, expires_at)
VALUES (1, 'random_generated_session_token', DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 1 HOUR));

-- Example: Check if the session token is valid (i.e., if the session hasn't expired)
SELECT * FROM user_sessions
WHERE session_token = 'random_generated_session_token' AND expires_at > CURRENT_TIMESTAMP;

-- 9. Retrieving and Displaying User Data in Web Applications
-- Once the data is retrieved from the database, the web application will use the data to display content to the user.

-- Example: Retrieve a user's profile details
SELECT user_id, username, email, role, created_at
FROM users
WHERE user_id = 1;

-- 10. Implementing Search Functionality
-- Web applications often include a search feature to allow users to search for data.

-- Example: Search for users based on part of their username or email
SELECT * FROM users
WHERE username LIKE '%john%' OR email LIKE '%example.com%';

-- Example: Search for users by role (admin, user, etc.)
SELECT * FROM users
WHERE role = 'admin';

-- 11. Pagination in SQL Queries
-- When dealing with large datasets, pagination helps load data in chunks.

-- Example: Select the first 10 users (for pagination)
SELECT * FROM users
ORDER BY created_at DESC
LIMIT 10 OFFSET 0;

-- Example: Select the next 10 users (for pagination)
SELECT * FROM users
ORDER BY created_at DESC
LIMIT 10 OFFSET 10;

-- 12. Optimizing Queries for Performance
-- As web applications grow, optimizing database queries becomes important for performance.
-- You can use indexes to speed up search queries.

-- Example: Create an index on the 'username' column to speed up lookups
CREATE INDEX idx_username ON users(username);

-- 13. Using Transactions for Consistency
-- For complex operations (e.g., registration and login), using transactions ensures that the operations are atomic.

-- Example: Begin a transaction to ensure consistency when inserting user data
START TRANSACTION;

-- Insert user data (registration example)
INSERT INTO users (username, password_hash, email, role)
VALUES ('new_user', 'hashed_password_example', 'new_user@example.com', 'user');

-- Commit the transaction (apply the changes)
COMMIT;

-- In case of error, rollback the transaction to maintain data integrity
ROLLBACK;

-- End of Web Integration with SQL
