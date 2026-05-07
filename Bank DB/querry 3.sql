use diksha_bank;
select distinct D.Customername
from Depositer D, Loan L
where (L.Branch_name,D.Customername) in (select B1.Branch_name , D1.Customername
										 from Depositer D1, BankAccount B1
                                         where D1.Accno = B1.accno
                                         and B1.Branch_name in (select Branch_name
																from Branch
                                                                where Branch_city = 'Bangalore'));