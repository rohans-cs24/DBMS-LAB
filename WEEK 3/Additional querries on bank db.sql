use diksha_bank;

-- have account in all branches in delhi
select distinct D.Customername
from Depositer D, Branch B, BankAccount BA
where BA.Branch_name = B.Branch_name
and BA.Accno = D.Accno 
and B.Branch_city = 'Delhi'
group by D.Customername
having count(distinct B.Branch_name) = (
				   select count(Branch_name)
				   from Branch 
                   where Branch_city = 'Delhi');
                   
-- have a loan but no account 
select distinct Customername
from Depositer
where Accno not in (select Accno 
				    from Loan);
                    
-- both account and laon in bengaluru branch
select distinct D.Customername
from Depositer D, Loan L
where (L.Branch_name,D.Customername) in (select B1.Branch_name , D1.Customername
										 from Depositer D1, BankAccount B1
                                         where D1.Accno = B1.accno
                                         and B1.Branch_name in (select Branch_name
																from Branch
                                                                where Branch_city = 'Bangalore'));

-- branches with assets more than that of bangalore branches 
select branch_name
from Branch
where assets > (
    select max(assets)
    from Branch
    where branch_city = 'Bangalore'
);

-- delete accounts in bangalore
delete from BankAccount
where Branch_name in (select Branch_name
					  from Branch 
                      where Branch_city = 'Bangalore');
select * from BankAccount;

-- update bank balace by 5%
update BankAccount
set Balance = Balance * 1.05;
select * from BankAccount;