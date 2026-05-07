use employee;
select distinct e.empno
from employee e, project p, assigned_to a
where e.empno = a.empno
and p.pno = a.pno
and p.ploc in ('Bengaluru','Hyderabad','Mysuru');

select distinct empno 
from employee
where empno not in(select empno 
						from incentives);
                        
select e.ename,
	   e.empno,
       d.dname,
       a.jod_role,
       d.dloc,
       p.ploc
from employee e,
	 assigned_to a,
     dept d,
     project p
where e.empno = a.empno
and p.pno = a.pno
and e.deptno = d.deptno
and d.dloc = p.ploc;