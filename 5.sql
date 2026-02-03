CREATE DATABASE IF NOT EXISTS db5;
USE db5;

-- Creating Department table
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

-- Creating Employee table
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Salary INT,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- Inserting into Department
INSERT INTO Department (DeptID, DeptName) VALUES 
(1, 'IT'), (2, 'HR'), (3, 'Finance'), (4, 'Legal');

-- Inserting into Employee
INSERT INTO Employee (EmpID, Name, Salary, DeptID) VALUES 
(101, 'Arun Sharma', 50000, 1),
(102, 'Neeta Pillai', 45000, 2),
(103, 'Vikram Rao', 55000, 1),
(104, 'Sara Ali', 60000, 3),
(105, 'Divya Kapoor', 40000, NULL);

-- EQUI JOIN: Explicit condition on matching column
SELECT E.Name, D.DeptName 
FROM Employee E 
JOIN Department D ON E.DeptID = D.DeptID;

-- NATURAL JOIN: Automatically joins on column(s) with same name
SELECT Name, DeptName 
FROM Employee 
NATURAL JOIN Department;

-- LEFT OUTER JOIN: All employees, even if they don't belong to a department
SELECT E.Name, D.DeptName 
FROM Employee E 
LEFT JOIN Department D ON E.DeptID = D.DeptID;

-- RIGHT OUTER JOIN: All departments, even those without employees
SELECT E.Name, D.DeptName 
FROM Employee E 
RIGHT JOIN Department D ON E.DeptID = D.DeptID;

-- FULL OUTER JOIN: All records from both tables
-- (Note: Here we used LEFT JOIN and RIGHT JOIN 'cause MySQL doesn't support FULL OUTER JOIN)
-- Combine LEFT JOIN and RIGHT JOIN to simulate FULL OUTER JOIN
SELECT E.Name, D.DeptName 
FROM Employee E 
LEFT JOIN Department D ON E.DeptID = D.DeptID

UNION

SELECT E.Name, D.DeptName 
FROM Employee E 
RIGHT JOIN Department D ON E.DeptID = D.DeptID;
 
-- USER DEFINED FUNCTION
-- Create a function to calculate annual salary
DELIMITER //
CREATE FUNCTION CalculateAnnualSalary(monthly_sal INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN monthly_sal * 12;
END //
DELIMITER ;

-- Invoke the function
SELECT Name, CalculateAnnualSalary(Salary) AS AnnualSalary 
FROM Employee 
WHERE EmpID = 101;
 
-- STORED PROCEDURE
-- Create a procedure to add a new employee
DELIMITER //
CREATE PROCEDURE AddEmployee(
    IN p_EmpID INT, 
    IN p_Name VARCHAR(100), 
    IN p_Salary INT, 
    IN p_DeptID INT
)
BEGIN
    INSERT INTO Employee (EmpID, Name, Salary, DeptID) 
    VALUES (p_EmpID, p_Name, p_Salary, p_DeptID);
END //
DELIMITER ;

-- Call the stored procedure
CALL AddEmployee(201, 'Rohit Das', 65000, 1);
CALL AddEmployee(202, 'Sneha Roy', 72000, 2);

-- Validate changes
SELECT EmpID, Name, Salary FROM Employee WHERE EmpID > 200;
