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
Select Gender,Max(salary)as MaxSalary from employee_payroll  group by Gender;
Select Gender,Sum(salary)as TotalSalary from employee_payroll where Gender='F' group by Gender;
Select Gender,Avg(salary)as AvgSalary from employee_payroll where Gender='M' group by Gender;
Select Gender, count(Gender)as Count from employee_payroll group by Gender order by Gender DESC;

------UC8 Default Value---------
alter table employee_payroll add phone bigint,address varchar(50),department varchar(50) not null default 'physical' ;

update employee_payroll set phone=54376543210,department='Testing',address='broadway' where name='lionel';
update employee_payroll set phone=32565412350,department='HR',address='parrys' where name='neymar';
update employee_payroll set phone=46387873210,department='Design',address='besent' where name='cristiano';
update employee_payroll set phone=34537347964,department='Automation',address='park Town' where name='Dias';
update employee_payroll set phone=74185296340,department='Security',address='egmore' where name='georgina';
update employee_payroll set phone=36347643630,department='Finance',address='broadway' where name='antolina';


----------UC9 Rename and Add Multiple Column----------
EXEC sp_rename'employee_payroll.salary','BasicPay','COLUMN';

alter table employee_payroll add Deductions float,TaxablePay float,IncomeTax float,NetPay float;

update employee_payroll set IncomeTax=2500,TaxablePay=10000;

update employee_payroll set Deductions=300,NetPay=300000 where name='lionel';
update employee_payroll set Deductions=1700,NetPay=15000 where name='neymar';
update employee_payroll set Deductions=2000,NetPay=300000 where name='cristiano';
update employee_payroll set Deductions=1500,NetPay=30000 where name='Dias';
update employee_payroll set Deductions=300,NetPay=12000 where name='georgina';
update employee_payroll set Deductions=550,NetPay=10000 where name='antolina';

select * from employee_payroll;

--------UC10 Duplicate data---------
Insert into employee_payroll values('cristiano',32000,'2021-04-25','M',54265442963,'Chennai','Marketing',500,10000,2300,15500);