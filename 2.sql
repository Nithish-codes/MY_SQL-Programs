CREATE DATABASE IF NOT EXISTS db2;
USE db2;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Student;
SET FOREIGN_KEY_CHECKS = 1;

-- Creating Department table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

-- Creating Student table with Foreign Key
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DepartmentID)
);

-- Inserting into Department
INSERT INTO Department VALUES (1, "Computer Science");
INSERT INTO Department VALUES (2, "Electronics");
INSERT INTO Department VALUES (3, "Mechanical");
INSERT INTO Department VALUES (4, "Computer Science");

-- Inserting valid data into Student
INSERT INTO Student VALUES (101, "Arjun Reddy", 1);
INSERT INTO Student VALUES (102, "Lakshmi Menon", 2);
INSERT INTO Student VALUES (103, "Rahul Singh", 1);
INSERT INTO Student VALUES (104, "Nithish Kumar P", 1);

-- Trying to insert with invalid foreign key INSERT INTO
-- INSERT INTO Student VALUES (105, "Invalid Entry", 5);

SELECT * FROM Department;
SELECT * FROM Student;
