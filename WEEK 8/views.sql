use supplierdb;
drop view if exists V1;
create view V1 as
select S.sname, count(*)
from supplier S, catalog C
where S.sid = C.sid
group by C.sid;
select * from V1;

drop view if exists V2;
create view V2 as
select S.sname, P.pname, C.cost
from supplier S, catalog C, parts P
where S.sid = C.sid
and P.pid = C.pid
and C.cost = (	select max(C1.cost)
				from catalog C1
                where P.pid = C1.pid 
                group by C1.pid);
select * from V2;