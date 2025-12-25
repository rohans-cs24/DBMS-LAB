use insurance;
-- display participated
select * from Participated
order by damage_amount desc;

-- average damage
select avg(damage_amount) from Participated;


-- delete rows
delete from Participated
where damage_amount < (select average_amount from(select avg(damage_amount) as average_amount
					   from Participated) as temp_table);
select * from participated;

-- more than average
select p.name as Name
from person p, participated q
where p.driver_id = q.driver_id
and q.damage_amount > (select avg(damage_amount) 
					   from Participated);
                    
-- max damage
select max(damage_amount) from Participated;