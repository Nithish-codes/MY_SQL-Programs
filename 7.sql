CREATE DATABASE IF NOT EXISTS db7;
USE db7;

-- Base Table
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Audit Table (Log)
DROP TABLE IF EXISTS Employee_Audit;
CREATE TABLE Employee_Audit (
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    EmpID INT,
    ActionType VARCHAR(20),
    OldValue DECIMAL(10, 2),
    NewValue DECIMAL(10, 2),
    ActionTimestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- AFTER INSERT trigger
DELIMITER //
CREATE TRIGGER after_employee_insert
AFTER INSERT ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO Employee_Audit (EmpID, ActionType, NewValue)
    VALUES (NEW.EmpID, 'INSERT', NEW.Salary);
END //
DELIMITER ;

-- AFTER UPDATE trigger
DELIMITER //
CREATE TRIGGER after_employee_update
AFTER UPDATE ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO Employee_Audit (EmpID, ActionType, OldValue, NewValue)
    VALUES (OLD.EmpID, 'UPDATE', OLD.Salary, NEW.Salary);
END //
DELIMITER ;

-- AFTER DELETE trigger
DELIMITER //
CREATE TRIGGER after_employee_delete
AFTER DELETE ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO Employee_Audit (EmpID, ActionType, OldValue)
    VALUES (OLD.EmpID, 'DELETE', OLD.Salary);
END //
DELIMITER ;

-- Execution
INSERT INTO Employees VALUES (101, 'Rahul', 50000);
UPDATE Employees SET Salary = 55000 WHERE EmpID = 101;
DELETE FROM Employees WHERE EmpID = 101;

-- Verification
SELECT * FROM Employee_Audit;


