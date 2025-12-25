create database if not exists emp;
use emp;

drop table if exists dept;
CREATE TABLE if not exists dept (
  deptno decimal(2,0) primary key,
  dname varchar(14) default NULL,
  loc varchar(13) default NULL
);


drop table if exists emp;
CREATE TABLE if not exists emp (
  empno decimal(4,0) primary key,
  ename varchar(10) default NULL,
  mgr_no decimal(4,0) default NULL,
  hiredate date default NULL,
  sal decimal(9,2) default NULL,
  deptno decimal(2,0) references dept(deptno) on delete cascade on update cascade
);

drop table if exists incentives;
create table if not exists incentives (
  empno decimal(4,0) references emp(empno) on delete cascade on update cascade,
  incentive_date date,
  incentive_amount decimal(10,2),
  primary key(empno,incentive_date)
  );
  
drop table if exists project;
Create table if not exists project (
 pno int primary key,
 pname varchar(30) not null,
 ploc varchar(30)
 );
 
drop table if exists assigned_to;
Create table if not exists assigned_to (
 empno decimal(4,0) references emp(empno) on delete cascade on update cascade,
 pno int references project(pno) on delete cascade on update cascade,
 job_role varchar(30),
 primary key(empno,pno)
 );

 show tables;
 
INSERT INTO dept VALUES (10,'ACCOUNTING','MUMBAI');
INSERT INTO dept VALUES (20,'RESEARCH','BENGALURU');
INSERT INTO dept VALUES (30,'SALES','DELHI');
INSERT INTO dept VALUES (40,'OPERATIONS','CHENNAI');

INSERT INTO emp VALUES (7369,'Adarsh',7902,'2012-12-17','80000.00','20');
INSERT INTO emp VALUES (7499,'Shruthi',7698,'2013-02-20','16000.00','30');
INSERT INTO emp VALUES (7521,'Anvitha',7698,'2015-02-22','12500.00','30');
INSERT INTO emp VALUES (7566,'Tanvir',7839,'2008-04-02','29750.00','20');
INSERT INTO emp VALUES (7654,'Ramesh',7698,'2014-09-28','12500.00','30');
INSERT INTO emp VALUES (7698,'Kumar',7839,'2015-05-01','28500.00','30');
INSERT INTO emp VALUES (7782,'CLARK',7839,'2017-06-09','24500.00','10');
INSERT INTO emp VALUES (7788,'SCOTT',7566,'2010-12-09','30000.00','20');
INSERT INTO emp VALUES ('7839','KING',NULL,'2009-11-17','500000.00','10');
INSERT INTO emp VALUES ('7844','TURNER',7698,'2010-09-08','15000.00','30');
INSERT INTO emp VALUES ('7876','ADAMS',7788,'2013-01-12','11000.00','20');
INSERT INTO emp VALUES ('7900','JAMES',7698,'2017-12-03','9500.00','30');
INSERT INTO emp VALUES ('7902','FORD','7566','2010-12-03','30000.00','20');


INSERT INTO incentives VALUES(7499,'2019-02-01',5000.00);
INSERT INTO incentives VALUES(7521,'2019-03-01',2500.00);
INSERT INTO incentives VALUES(7566,'2022-02-01',5070.00);
INSERT INTO incentives VALUES(7654,'2020-02-01',2000.00);
INSERT INTO incentives VALUES(7654,'2022-04-01',879.00);
INSERT INTO incentives VALUES(7521,'2019-02-01',8000.00);
INSERT INTO incentives VALUES(7698,'2019-03-01',500.00);
INSERT INTO incentives VALUES(7698,'2020-03-01',9000.00);
INSERT INTO incentives VALUES(7698,'2022-04-01',4500.00);

INSERT INTO project VALUES(101,'AI Project','BENGALURU');
INSERT INTO project VALUES(102,'IOT','HYDERABAD');
INSERT INTO project VALUES(103,'BLOCKCHAIN','BENGALURU');
INSERT INTO project VALUES(104,'DATA SCIENCE','MYSURU');
INSERT INTO project VALUES(105,'AUTONOMUS SYSTEMS','PUNE');

INSERT INTO assigned_to VALUES(7499,101,'Software Engineer');
INSERT INTO assigned_to VALUES(7521,101,'Software Architect');
INSERT INTO assigned_to VALUES(7566,101,'Project Manager');
INSERT INTO assigned_to VALUES(7654,102,'Sales');
INSERT INTO assigned_to VALUES(7521,102,'Software Engineer');
INSERT INTO assigned_to VALUES(7499,102,'Software Engineer');
INSERT INTO assigned_to VALUES(7654,103,'Cyber Security');
INSERT INTO assigned_to VALUES(7698,104,'Software Engineer');
INSERT INTO assigned_to VALUES(7900,105,'Software Engineer');
INSERT INTO assigned_to VALUES(7839,104,'General Manager');
Select * from dept;
select * from emp;
select * from incentives;
select * from project;
select * from assigned_to;

select distinct e.empno
from emp e, assigned_to a, project p
where e.empno=a.empno and a.pno=p.pno and 
p.ploc in ('Bengaluru','Hyderabad','Mysuru');

select distinct empno
from emp
where empno  not in (select distinct empno
						from incentives);

select e.ename,e.empno,d.dname,a.job_role,d.loc,p.ploc
from emp e, assigned_to a, project p, dept d
where e.empno = a.empno
and p.pno = a.pno
and e.deptno = d.deptno
and p.ploc = d.loc;                        