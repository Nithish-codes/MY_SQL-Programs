CREATE DATABASE IF NOT EXISTS db4;
USE db4;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Employee;
SET FOREIGN_KEY_CHECKS = 1;

-- Creating Department table
CREATE TABLE Department (
    DeptID   INT PRIMARY KEY,
    DeptName VARCHAR(20) NOT NULL
);

-- Creating Employee table
CREATE TABLE Employee (
    EmpID   INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Salary  DECIMAL(10, 2),
    DeptID  INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

INSERT INTO Department VALUES 
    (1, "IT"),
    (2, "HR"),
    (3, "Finance");
INSERT INTO Employee VALUES 
    (101, "Alex",            75000, 1),
    (102, "Bob",             62000, 2),
    (103, "Charlie",         80000, 1),
    (104, "David",           55000, 3),
    (105, "Nithish Kumar P", 61000, 2);
-- Get employees earning more than the average salary
SELECT EmpName, 
       Salary 
FROM   Employee 
WHERE  Salary > (SELECT AVG(Salary) FROM Employee);
-- List departments that have employees earning > 70000
SELECT DeptName 
FROM   Department 
WHERE  DeptID IN (SELECT DeptID FROM Employee WHERE Salary > 70000);

-- Simple INNER JOIN using WHERE clause
SELECT e.EmpName, 
       d.DeptName 
FROM   Employee e, 
       Department d 
WHERE  e.DeptID = d.DeptID;

-- Explicit INNER JOIN with filtering
SELECT EmpName, 
       Salary 
FROM   Employee 
INNER JOIN Department 
        ON Employee.DeptID = Department.DeptID 
WHERE  Department.DeptName = "HR";
