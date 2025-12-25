create database if not exists supplierdb;
use supplierdb;
create table if not exists SUPPLIER(
	sid integer(5) primary key, 
    sname varchar(20), 
    city varchar(20)
);
desc supplier;
create table if not exists PARTS(
	pid integer(5) primary key, 
    pname varchar(20), 
    color varchar(10)
);
desc parts;
create table if not exists CATALOG(
	sid integer(5), 
    pid integer(5),  
    foreign key(sid) references SUPPLIER(sid), 
    foreign key(pid) references PARTS(pid), 
    cost float(6)
);
desc catalog;