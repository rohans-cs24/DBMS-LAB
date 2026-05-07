use diksha_bank;
delete from BankAccount
where Branch_name in (select Branch_name
					  from Branch 
                      where Branch_city = 'Bangalore');