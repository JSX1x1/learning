-- ============================================
-- DATABASE REPLICATION & BACKUP STRATEGIES
-- ============================================

-- 1️⃣ FULL DATABASE BACKUP (MySQL)
-- Creates a full backup of the database
BACKUP DATABASE my_database 
TO DISK = 'C:\backups\my_database_full.bak' 
WITH FORMAT, INIT, NAME = 'Full Backup of my_database';

-- 2️⃣ INCREMENTAL BACKUP (MySQL Binary Log Backup)
-- This captures only changes since the last backup
BACKUP LOG my_database 
TO DISK = 'C:\backups\my_database_log.trn';

-- 3️⃣ AUTOMATIC BACKUP SCHEDULING (MySQL Event Scheduler)
-- Runs a backup every day at midnight
CREATE EVENT daily_backup
ON SCHEDULE EVERY 1 DAY 
STARTS TIMESTAMP(CURRENT_DATE, '00:00:00')
DO
BACKUP DATABASE my_database 
TO DISK = 'C:\backups\my_database_daily.bak';

-- ============================================
-- DATABASE REPLICATION (MASTER-SLAVE SETUP)
-- ============================================

-- 4️⃣ ENABLE MASTER SERVER (MySQL)
-- Configures the master database for replication
CHANGE MASTER TO 
MASTER_HOST = '192.168.1.100',
MASTER_USER = 'replication_user',
MASTER_PASSWORD = 'secure_password',
MASTER_LOG_FILE = 'mysql-bin.000001',
MASTER_LOG_POS = 4;

-- 5️⃣ START THE MASTER REPLICATION
START SLAVE;

-- 6️⃣ CHECK REPLICATION STATUS
SHOW SLAVE STATUS \G;

-- ============================================
-- REPLICATION MONITORING & ERROR HANDLING
-- ============================================

-- 7️⃣ CHECK MASTER SERVER STATUS
SHOW MASTER STATUS;

-- 8️⃣ RESET REPLICATION IN CASE OF FAILURE
STOP SLAVE;
RESET SLAVE;
START SLAVE;

-- 9️⃣ ENSURE REPLICATION IS WORKING
-- Compares data between master and slave databases
SELECT COUNT(*) FROM master_database.my_table;
SELECT COUNT(*) FROM slave_database.my_table;

-- 1️⃣0️⃣ AUTOMATED REPLICATION CHECK SCRIPT (MySQL EVENT)
CREATE EVENT check_replication
ON SCHEDULE EVERY 5 MINUTE
DO
BEGIN
  DECLARE slave_running INT;
  SELECT COUNT(*) INTO slave_running FROM information_schema.processlist 
  WHERE user = 'replication' AND command = 'Binlog Dump';
  
  IF slave_running = 0 THEN
    INSERT INTO admin_logs (event, timestamp) 
    VALUES ('Replication failure detected', NOW());
  END IF;
END;

-- ============================================
-- POINT-IN-TIME RECOVERY (PITR)
-- ============================================

-- 1️⃣1️⃣ ENABLE BINLOG FOR POINT-IN-TIME RECOVERY (PITR)
-- Make sure binary logging is enabled in `my.cnf`
SET GLOBAL binlog_format = 'ROW';

-- 1️⃣2️⃣ RESTORE FROM A FULL BACKUP FIRST
RESTORE DATABASE my_database 
FROM DISK = 'C:\backups\my_database_full.bak';

-- 1️⃣3️⃣ APPLY INCREMENTAL LOGS UP TO A SPECIFIC POINT
RESTORE LOG my_database 
FROM DISK = 'C:\backups\my_database_log.trn'
STOP AT '2025-04-01 12:00:00';

-- ============================================
-- FINAL CHECKS & MAINTENANCE
-- ============================================

-- 1️⃣4️⃣ CHECK REPLICATION LAG
SHOW SLAVE STATUS \G;

-- 1️⃣5️⃣ ENSURE BACKUPS EXIST
SELECT * FROM information_schema.files WHERE file_type = 'BACKUP';

-- 1️⃣6️⃣ VERIFY BACKUP RESTORATION
RESTORE VERIFYONLY 
FROM DISK = 'C:\backups\my_database_full.bak';

