---------UC1-Creating database--------
create database payroll_service;

---------UC2-Create Table-----------
create table employee_payroll(
id int identity(1,1) primary key,
name varchar(200) not null,
salary float,
startDate date
);

---------UC3- Insert data to Table-----------
insert into employee_payroll values 
('lionel',300000,'2008-03-05'),('neymar',10000,'2011-06-14'),
('cristiano',25000,'2005-07-07'),('Dias',5000,'2020-05-03');
