create DATABASE if not exists db1;
use db1;


-- Creating the Students table
drop table if exists Student;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT CHECK (Age >= 18),
    Department VARCHAR(10)
);

-- Inestring values
insert into Student value(1,"Ananya Sharma",20,"CSE");
insert into Student value(2, "Ravi Kumar", 21, "ECE");
insert into Student value(3, "Meera Iyer", 19, "IT");
insert into Student value(4, "Nithish Kumar P", 19, "CSE");

-- Updating values in record
update Student set Age = 25 where StudentId = 3;

-- Deleting a record
delete  from Student where StudentID = 3;

-- Querying table
select * FROM Student;

