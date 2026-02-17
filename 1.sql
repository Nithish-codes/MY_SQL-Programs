CREATE DATABASE IF NOT EXISTS db1;
USE db1;

-- Creating the Students table
DROP TABLE IF EXISTS Student;

CREATE TABLE Student (
    StudentID  INT PRIMARY KEY,
    Name       VARCHAR(50) NOT NULL,
    Age        INT CHECK (Age >= 18),
    Department VARCHAR(10)
);

-- Inestring values
INSERT INTO Student VALUES (1, "Ananya Sharma",   20, "CSE");
INSERT INTO Student VALUES (2, "Ravi Kumar",      21, "ECE");
INSERT INTO Student VALUES (3, "Meera Iyer",      19, "IT");
INSERT INTO Student VALUES (4, "Nithish Kumar P", 19, "CSE");

-- Updating values in record
UPDATE Student 
SET    Age = 25 
WHERE  StudentID = 3;

-- Deleting a record
DELETE FROM Student 
WHERE  StudentID = 3;

-- Querying table
SELECT * FROM Student;