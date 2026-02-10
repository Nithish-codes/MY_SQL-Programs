CREATE DATABASE IF NOT EXISTS db6;
USE db6;

-- Create User
DROP USER IF EXISTS "demo_user"@"localhost";
CREATE USER "demo_user"@"localhost" IDENTIFIED BY "demo123";

-- Granting privileges
GRANT SELECT, INSERT, UPDATE ON testdb.* TO 'demo_user'@'localhost';

-- Revoking previleges
REVOKE UPDATE ON testdb.* FROM 'demo_user'@'localhost';

 -- Viewing current previleges
 SHOW GRANTS FOR 'demo_user'@'localhost';


-- TCL : Transaction Control Language
-- Create table
DROP TABLE IF EXISTS Account;
CREATE TABLE Account (
    AccID INT PRIMARY KEY,
    Name VARCHAR(100),
    Balance INT
);

-- Inserting initial data
INSERT INTO Account VALUES
(1, 'Rahul', 8000),
(2, 'Sneha', 10000);

-- Start a transaction
START TRANSACTION;

UPDATE Account SET Balance = Balance - 2000 WHERE AccID = 1;
UPDATE Account SET Balance = Balance + 2000 WHERE AccID = 2;

-- Savepoint
SAVEPOINT transfer_done;

-- Commit changes
COMMIT;

-- Rollback
START TRANSACTION;

UPDATE Account SET Balance = Balance - 3000 WHERE AccID = 1;

ROLLBACK;

-- Final view
SELECT * FROM Account;