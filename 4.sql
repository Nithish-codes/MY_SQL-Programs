create database if not exists db4;
use db4;

set FOREIGN_KEY_CHECKS = 0;
drop table if exists Department;
drop table if exists Employee;

-- Creating Department table
create table Department(
	DeptID int primary key,
    DeptName varchar(20) not null
); 

-- Creating Employee table
create table Employee(
	EmpID int primary key,
    EmpName varchar(50) not null,
    Salary decimal(10,2),
    DeptID int,
    foreign key (DeptID) references Department(DeptID)
);

-- Insert into Department
insert into Department values (1,"IT");
insert into Department values (2,"HR");
insert into Department values (3,"Finance");

-- Insert into Employee
insert into Employee values 
(101, "Alex", 75000, 1),
(102, "Bob", 62000, 2),
(103, "Charlie", 80000, 1),
(104, "David", 55000, 3),
(105, "Nithish Kumar P", 61000, 2);

-- Subquery: Get employees earning more than the average salary
select EmpName, Salary from Employee where Salary > (select avg(Salary) from Employee);

-- Subquery with IN: List departments that have employees earning > 70000
select DeptName from Department where DeptID in (select DeptId from Employee where Salary > 70000);

-- Simple INNER JOIN
select e.EmpName, d.DeptName from Employee e, Department d where e.DeptID = d.DeptID;

-- JOIN with condition
select EmpName, Salary from Employee inner join Department on Employee.DeptID = Department.DeptID where Department.DeptName = "HR";