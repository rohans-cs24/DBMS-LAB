use diksha_bank;
select distinct Customername
from Depositer
where Accno not in (select Accno 
				    from Loan);