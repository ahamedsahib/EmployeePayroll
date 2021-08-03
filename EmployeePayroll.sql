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

 -------UC11 Normalization-----------
 --Using Er Diagram--

--Creating Company table
create table Company(
	CompanyId int identity(1,1) Primary key,
	CompanyName varchar(30)
);

--Creating Employee Table
create table Employee(
	EmployeeId int identity(1,1) Primary key,
	CompanyId int FOREIGN KEY REFERENCES Company(CompanyId),
	EmployeeName varchar(30),
	PhoneNumber bigint,
	EmpAddress varchar(50),
	StartDate date,
	Gender char(1)
);
--Creating Payroll table
create table Payroll(
	EmployeeId int FOREIGN KEY REFERENCES Employee(EmployeeId),
	BasicPay float,
	TaxablePay float,
	IncomeTax float,
	NetPay float,
	Deductions float
);

--Creating Deptartment table
create table Department(
	DeptId int identity(1,1) Primary key,
	DepartmentName varchar(30)
);
--Creating EmployeeDepartment Table
create table EmployeeDepartment(
	EmployeeId int FOREIGN KEY REFERENCES Employee(EmployeeId),
	DeptId int FOREIGN KEY REFERENCES Department(DeptId),
);

Insert into Company values('Nike'),('Addidas'),('PUMA');

-------------
Insert into Employee values
 (1,'Ahamed',96473829856,'Chennai','2021-05-25','M'),
 (2,'Ashfaq',8326528211,'Delhi','2018-3-13','M'),
(2,' Noohu',82445433210,'Calcutta','2008-7-13','M'),
(3,'Sam',9876543210,'Banglaore','2005-6-11','F');

SELECT * FROM Employee;


-------
Insert into Payroll(EmployeeId,BasicPay,IncomeTax,Deductions) Values (1,25000,1000,1200),(2,17000,1000,600),(3,35000,1000,700),(4,22000,1000,700);
SELECT * FROM Payroll;
--Updating taxable pay based on basic pay - deductions
Update Payroll set TaxablePay=BasicPay-Deductions;
--Updating Netpay based on taxablepay-incometax
Update Payroll set NetPay=TaxablePay-IncomeTax;


---------------------------------------------------------------------------
INSERT INTO Department values('Developer'),('IT'),('Marketing'),('sales');

SELECT * FROM Department;

---------------------------------------------------------------------------
INSERT INTO EmployeeDepartment values(1,2),(2,1),(3,4),(4,4);

SELECT * FROM EmployeeDepartment;

--AGGREGATE FUNCTIONS
----------------------------------------------------------------------------
SELECT SUM(p.BasicPay) as TotalSalary,emp.Gender
FROM Employee as emp
INNER JOIN
Payroll as p ON
emp.EmployeeId = p.EmployeeId
GROUP BY Gender
ORDER BY Gender DESC;
---------------------------------------------------------------------------
SELECT AVG(p.BasicPay) as AverageSalary,emp.Gender
FROM Employee as emp
INNER JOIN
Payroll as p ON
emp.EmployeeId = p.EmployeeId
GROUP BY Gender
ORDER BY Gender DESC;
---------------------------------------------------------------------------
SELECT MIN(p.BasicPay) as MinSalary,emp.Gender
FROM Employee as emp
INNER JOIN
Payroll as p ON
emp.EmployeeId = p.EmployeeId
GROUP BY Gender
ORDER BY Gender DESC;
-------------------------------------------------------------------------------
SELECT MAX(p.BasicPay) as MaxSalary,emp.Gender
FROM Employee as emp
INNER JOIN
Payroll as p ON
emp.EmployeeId = p.EmployeeId
GROUP BY Gender
ORDER BY Gender DESC;
-------------------------------------------------------------------------------
SELECT COUNT(p.BasicPay) as TotalCount,emp.Gender
FROM Employee as emp
INNER JOIN
Payroll as p ON
emp.EmployeeId = p.EmployeeId
GROUP BY Gender
ORDER BY Gender DESC;
