CREATE DATABASE IF NOT EXISTS db3;
USE db3;

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
    EmpID   INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Age     INT(2),
    Dept    VARCHAR(20),
    Salary  DECIMAL(10, 2)
);


INSERT INTO Employee VALUES 
    (1, "Alice",           28, "HR",    55000),
    (2, "Bob",             35, "IT",    72000),
    (3, "Charlie",         30, "Sales", 50000),
    (4, "David",           26, "HR",    52000),
    (5, "Nithish Kumar P", 32, "IT",    75000);

-- Average salary across the whole company
SELECT AVG(Salary) AS AvgSalary 
FROM   Employee;

-- Maximum age in the workforce
SELECT MAX(Age) AS OldestEmployee 
FROM   Employee;

-- Total salary expenditure for the IT department
SELECT SUM(Salary) AS TotalITSalary 
FROM   Employee 
WHERE  Dept = "IT";

-- Employee headcount per department
SELECT   Dept, 
         COUNT(EmpID) AS EmpCount 
FROM     Employee 
GROUP BY Dept;

-- Average salary by department (Only showing high-pay departments)
SELECT   Dept, 
         AVG(Salary) AS AvgSalary 
FROM     Employee 
GROUP BY Dept 
HAVING   AvgSalary > 60000;