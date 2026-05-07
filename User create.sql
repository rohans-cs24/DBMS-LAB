use mysql;
create user rohan identified by "rohan123";
grant all privileges on *.* to "rohan";
flush privileges;