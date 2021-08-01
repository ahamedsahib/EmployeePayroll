---------UC1-Creating database--------
create database payroll_service;

---------UC2-Create Table-----------
create table employee_payroll(
id int identity(1,1) primary key,
name varchar(200) not null,
salary float,
startDate date
);