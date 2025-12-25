create database if not exists diksha_bank;
use diksha_bank; 

-- create tables
create table if not exists Branch(
	Branch_name varchar(20),
    Branch_city varchar(20), 
    Assets varchar(20), 
    primary key(Branch_name)
); 
create table if not exists BankAccount(
	accno varchar(20),
    Branch_name varchar(20), 
    Balance varchar(20), 
    primary key(accno),
    foreign key(Branch_name) references Branch(Branch_name)
); 
create table if not exists BankCustomer(
	Customername varchar(20),
    Customerstreet varchar(20), 
    Customercity varchar(20),
    primary key(Customername)
); 
create table if not exists Depositer(
	Customername varchar(20),
    accno varchar(20), 
    primary key(accno), 
    foreign key(accno) references BankAccount(accno)
); 
create table if not exists Loan(
	loan_num int,
    Branch_name varchar(20), 
    Amount varchar(20), 
    primary key(loan_num), 
    foreign key(Branch_name) references Branch(Branch_name)
); 
 
-- insert tuples
insert into Branch values("SBI_Chamrajpet", "Bangalore", 50000); 
insert into Branch values("SBI_ResidencyRoad", "Bangalore", 10000); 
insert into Branch values("SBI_ShivajiRoad", "Bombay", 20000); 
insert into Branch values("SBI_ParlimentRoad", "Delhi", 10000); 
insert into Branch values("SBI_Jantarmantar", "Delhi", 20000); 
 
insert into BankAccount values(1, "SBI_Chamrajpet",2000 ); 
insert into BankAccount values(2, "SBI_ResidencyRoad", 5000); 
insert into BankAccount values(3, "SBI_ShivajiRoad", 6000); 
insert into BankAccount values(4, "SBI_ParlimentRoad", 9000); 
insert into BankAccount values(5, "SBI_Jantarmantar", 8000); 
insert into BankAccount values(6, "SBI_ShivajiRoad", 8000); 
insert into BankAccount values(8, "SBI_ResidencyRoad", 8000); 
insert into BankAccount values(9, "SBI_ParlimentRoad", 8000); 
insert into BankAccount values(10, "SBI_ResidencyRoad", 8000); 
insert into BankAccount values(11, "SBI_Jantarmantar", 8000);

insert into BankCustomer values("Avinash", "Bull temple road","Bangalore" ); 
insert into BankCustomer values("Dinesh", "Bannerghatta Road","Bangalore" ); 
insert into BankCustomer values("Mohan", "NationalCollegeRoad","Bangalore" ); 
insert into BankCustomer values("Nikhil", "Akbar Road","Delhi" ); 
insert into BankCustomer values("Ravi", "Prithviraj Road","Delhi" ); 
 
insert into Depositer values("Avinash", 1); 
insert into Depositer values("Dinesh", 2); 
insert into Depositer values("Mohan", 3); 
insert into Depositer values("Nikhil", 4); 
insert into Depositer values("Ravi", 5); 
insert into Depositer values("Avinash", 8); 
insert into Depositer values("Nikhil", 9); 
insert into Depositer values("Dinesh", 10); 
insert into Depositer values("Nikhil", 11); 
 
insert into Loan values(1, "SBI_Chamrajpet", 1000); 
insert into Loan values(2, "SBI_ResidencyRoad", 2000); 
insert into Loan values(3, "SBI_ShivajiRoad", 3000); 
insert into Loan values(4, "SBI_ParlimentRoad", 4000); 
insert into Loan values(5, "SBI_Jantarmantar", 5000); 

-- assets in lakhs
select Branch_name , concat(Assets/100000,' lakhs') as assests_in_lakhs 
from Branch; 

-- atleast one account in sbi_residencyroad
select d.Customername 
from Depositer d, BankAccount b 
where b.Branch_name='SBI_ResidencyRoad' 
and d.Accno=b.Accno 
group by d.Customername 
having count(d.Accno)>=2; 
 
-- view
create view v1 
as 
select Branch_name, sum(amount) 
from loan 
group by Branch_name; 
select * from v1 ;
