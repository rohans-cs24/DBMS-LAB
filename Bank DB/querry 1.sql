use diksha_bank;
select distinct S.Customername
from Depositer S
where not exists ((select Branch_name
				   from Branch
                   where Bracnh_city = 'Delhi')
                   except (select R.Branch_name 
						   from Depositer T, BackAccount R
                           where R.Accno = T.Accno
                           and S.Customername = T.Customername));