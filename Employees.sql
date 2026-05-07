use school;
set sql_safe_updates=0;
drop table if exists Employees;
create table if not exists Employees
(ID numeric not null,
Ename varchar(20),
Age numeric check(Age>18 and Age<60),
Address varchar(30),
Salary numeric not null,
Dept varchar(10) default 'Helpers');
insert into Employees(ID,Ename,Age,Address,Salary,Dept)values('1','Ramesh','32','Ahmedabad','20000','HR');
insert into Employees(ID,Ename,Age,Address,Salary,Dept)values('2','Rahul','25','Dehli','15000','MRKT');
insert into Employees(ID,Ename,Age,Address,Salary)values('3','Kaushik','27','Chennai','20000');
insert into Employees(ID,Ename,Age,Address,Salary,Dept)values('4','Charan','25','Dehli','65000','IT');
insert into Employees(ID,Ename,Age,Address,Salary,Dept)values('5','Hardik','27','Mumbai','85000','IT');
insert into Employees(ID,Ename,Age,Address,Salary,Dept)values('6','Komal','27','Hyderabad','45000','Finance');
insert into Employees(ID,Ename,Age,Address,Salary,Dept)values('7','Sheetal','25','Mumbai','70000','MRKT');
-- Display the whole table
select * from Employees;
-- Display employee name and age from table
select Ename,Age 
from Employees;
-- Display names of employees whose age if 27
select Ename
from Employees
where Age=27;
-- Display all distinct addresses
select distinct Address
from Employees;
-- Display print the total numbers of places employees are from
select count(distinct Address)
from Employees;
-- Display the total number of unique salaries
select count(distinct Salary)
from Employees;
-- Display the unique salaries
select distinct Salary
from Employees;
-- Display the unique salaries between 40000 and 80000
select distinct Salary
from Employees
where Salary>40000 and Salary<80000;
-- Display maximum salary
select max(Salary)
from Employees;
set sql_safe_updates=1;
