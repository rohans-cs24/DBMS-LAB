use supplierdb;
insert into supplier values(10001, ' Acme Widget','Bangalore');
insert into supplier values(10002, ' Johns','Kolkata');
insert into supplier values(10003, ' Vimal','Mumbai');
insert into supplier values(10004, ' Reliance','Delhi');
insert into supplier values(10005, ' Mahindra','Mumbai');
select * from supplier;

insert into PARTS values(20001, 'Book','Red');
insert into PARTS values(20002, 'Pen','Red');
insert into PARTS values(20003, 'Pencil','Green');
insert into PARTS values(20004, 'Mobile','Green');
insert into PARTS values(20005, 'Charger','Black');
select * from parts;

insert into CATALOG values(10001, 20001,10);
insert into CATALOG values(10001, 20002,10);
insert into CATALOG values(10001, 20003,30);
insert into CATALOG values(10001, 20004,10);
insert into CATALOG values(10001, 20005,10);
insert into CATALOG values(10002, 20001,10);
insert into CATALOG values(10002, 20002,20);
insert into CATALOG values(10003, 20003,30);
insert into CATALOG values(10004, 20003,40);
select * from catalog;

