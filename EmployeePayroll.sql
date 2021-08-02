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
('georgina',3000,'2006-08-05','F'),('antolina',1500,'2013-06-04','F'),
('cristiano',25000,'2005-07-07'),('Dias',5000,'2020-05-03');

-------UC4-Retrieve Data------------
select * from employee_payroll;

--------UC5- Retrieving particular Data--------
select salary,startDate from employee_payroll where name='neymar'; 
select * from employee_payroll where startDate between cast('2010-10-10' as date) and getdate();

---------UC6-Alter table by Adding Column----------
alter table employee_payroll add Gender char ;

update employee_payroll set Gender='M';

----------UC7-Aggreate Function------------
Select Gender,Min(salary)as MinSalary from employee_payroll group by Gender;
--Max--
 Select Gender,Max(salary)as MaxSalary from employee_payroll  group by Gender;
 --Sum--
 Select Gender,Sum(salary)as TotalSalary from employee_payroll where Gender='F' group by Gender;
 --Avg--
 Select Gender,Avg(salary)as AvgSalary from employee_payroll where Gender='M' group by Gender;
 --Count--
 Select Gender, count(Gender)as Count from employee_payroll group by Gender order by Gender DESC;