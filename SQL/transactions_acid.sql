-- ============================================
-- TRANSACTIONS & ACID COMPLIANCE IN SQL
-- ============================================

-- 1️⃣ BEGIN TRANSACTION: Ensures Atomicity  
-- The transaction starts here. If any statement fails, everything is rolled back.
START TRANSACTION;

-- 2️⃣ INSERT OPERATION: Ensures Consistency  
-- Adds a new user to the users table. If this fails, the balance update should not happen.
INSERT INTO users (id, name, email) VALUES (101, 'John Doe', 'john.doe@example.com');

-- 3️⃣ UPDATE OPERATION: Ensures Atomicity  
-- Updates the account balance. This should only happen if the user insertion was successful.
UPDATE accounts SET balance = balance - 500 WHERE user_id = 101;

-- 4️⃣ CHECK CONSISTENCY: Ensure values are valid before committing  
-- If the balance becomes negative, the transaction should be rolled back.
SELECT balance FROM accounts WHERE user_id = 101 HAVING balance >= 0;

-- 5️⃣ COMMIT TRANSACTION: Ensures Durability  
-- If all operations succeed, commit the transaction to make changes permanent.
COMMIT;


-- ============================================
-- ROLLBACK ON FAILURE
-- ============================================

-- If any of the above operations fail, roll back all changes.
ROLLBACK;


-- ============================================
-- ISOLATION LEVELS
-- ============================================

-- Setting different isolation levels to control concurrency effects

-- Read Uncommitted: Allows dirty reads (rarely used in financial systems)
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

-- Read Committed: Ensures no dirty reads occur
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Repeatable Read: Ensures no non-repeatable reads
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Serializable: Highest isolation, prevents all concurrency issues
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;


-- ============================================
-- TRANSACTION EXAMPLE: MONEY TRANSFER
-- ============================================

START TRANSACTION;

-- Deduct money from sender
UPDATE accounts SET balance = balance - 100 WHERE user_id = 1;

-- Add money to receiver
UPDATE accounts SET balance = balance + 100 WHERE user_id = 2;

-- Check if sender’s balance is not negative
SELECT balance FROM accounts WHERE user_id = 1 HAVING balance >= 0;

-- If all queries are successful, commit the transaction
COMMIT;

-- If any query fails, rollback
ROLLBACK;


-- ============================================
-- TESTING TRANSACTION DURABILITY
-- ============================================

-- Step 1: Start a transaction and make changes
START TRANSACTION;
UPDATE accounts SET balance = balance + 100 WHERE user_id = 3;

-- Step 2: Simulate a system crash before committing

-- Step 3: Restart the database and check if changes were committed
SELECT * FROM accounts WHERE user_id = 3;  -- Should not reflect the change if the transaction was not committed
