CREATE DATABASE IF NOT EXISTS db4;
USE db4;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Employee;

-- Creating Department table
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(20) NOT NULL
); 

-- Creating Employee table
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- Insert into Department
INSERT INTO Department VALUES (1,"IT");
INSERT INTO Department VALUES (2,"HR");
INSERT INTO Department VALUES (3,"Finance");

-- Insert into Employee
INSERT INTO Employee VALUES 
(101, "Alex", 75000, 1),
(102, "Bob", 62000, 2),
(103, "Charlie", 80000, 1),
(104, "David", 55000, 3),
(105, "Nithish Kumar P", 61000, 2);

-- Subquery: Get employees earning more than the average salary
SELECT EmpName, Salary 
FROM Employee 
WHERE Salary > (SELECT AVG(Salary) FROM Employee);

-- Subquery with IN: List departments that have employees earning > 70000
SELECT DeptName 
FROM Department 
WHERE DeptID IN (SELECT DeptID FROM Employee WHERE Salary > 70000);

-- Simple INNER JOIN
SELECT e.EmpName, d.DeptName 
FROM Employee e, Department d 
WHERE e.DeptID = d.DeptID;

-- JOIN with condition
SELECT EmpName, Salary 
FROM Employee 
INNER JOIN Department 
ON Employee.DeptID = Department.DeptID 
WHERE Department.DeptName = "HR";
