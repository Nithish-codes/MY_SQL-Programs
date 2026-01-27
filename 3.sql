create database if not exists db3;
use db3;

-- Creating the Employee table
drop table if exists Employee;
create table Employee(
	EmpID int primary key,
    EmpName varchar(50),
    Age int(2),
    Dept varchar(20),
    Salary Decimal(10,2)
);

-- Inserting values into Employee table
insert into Employee values 
(1, "Alice", 28, "HR", 55000),
(2, "Bob", 35, "IT", 72000),
(3, "Charlie", 30, "Sales", 50000),
(4, "David", 26, "HR", 52000),
(5, "Nithish Kumar P", 32, "IT", 75000);

-- Using aggregate functions
-- Average salary
select avg(Salary) as AvgSalary from Employee;

-- Maximum age
select max(Age) as OldestEmployee from Employee;

-- Total salary paid to IT department
select sum(Salary) as TotalITSalary from Employee where Dept = "IT";

-- Number of employees in each department
select Dept, count(EmpID) as EmpCount from Employee group by Dept;

-- Average salary by department, filtering only those > 60000
select Dept, avg(Salary) as AvgSalary from Employee group by Dept having AvgSalary > 60000;

