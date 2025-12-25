use supplierdb;
select S.sname , P.pname , C.cost
from Supplier S , Catalog C , Parts P
where S.sid = C.sid
and P.pid = C.pid
and C.cost =(select max(cost)
            from catalog);

select s.sname 
from supplier s
where not exists (	select 1
					from catalog C, parts P
                    where c.pid = p.pid
                    and s.sid = c.sid
                    and p.color = 'red');
                    
select s.sname, sum(c.cost) as total
from supplier s, catalog c
where s.sid = c.sid
group by c.sid;

select S.sname 
from supplier S
where 1 < (	select count(*)
			from catalog C
			where S.sid = C.sid
			and C.cost < 20);
            
select S.sname, P.pname, C.cost
from supplier S, catalog C, parts P
where S.sid = C.sid
and P.pid = C.pid
and C.cost = (	select min(C1.cost)
				from catalog C1
                where P.pid = C1.pid 
                group by C1.pid);
