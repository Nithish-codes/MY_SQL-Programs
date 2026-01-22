create database if not exists db2;
use db2;

set FOREIGN_KEY_CHECKS = 0;
drop table if exists Department;
drop table if exists Student;
set FOREIGN_KEY_CHECKS = 1;
-- Creating Department table

create table Department(
	DepartmentID int primary key,
    DepartmentName varchar(50) not null
);

-- Creating Student table with Foreign Key

create table Student(
	StudentID int primary key,
    StudentName varchar(50) not null,
    DeptID int,
    foreign key (DeptID) references Department(DepartmentID)
);

-- Inserting into Department
insert into Department values (1, "Computer Science");
insert into Department values (2, "Electronics");
insert into Department values (3, "Mechanical");
insert into Department values (4, "Computer Science");

-- Inserting valid data into Student
insert into Student values(101, "Arjun Reddy", 1);
insert into Student values(102, "Lakshmi Menon", 2);
insert into Student values(103, "Rahul Singh", 1);
insert into Student values(104, "Nithish Kumar P", 1);

-- Trying to insert with invalid foreign key INSERT INTO
-- insert into Student values (105, "Invalid Entry", 5);

select * from Department;
select * from Student;
