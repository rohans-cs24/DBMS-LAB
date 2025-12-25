use supplierdb;
drop trigger if exists t1;
DELIMITER $$
CREATE TRIGGER t1
BEFORE INSERT ON Catalog
FOR EACH ROW
BEGIN
    IF 
		NEW.cost < 1 
	THEN
        SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Cost must be at least 1';
    END IF;
END$$
DELIMITER ;
insert into CATALOG values(10001, 20001,0);
DELIMITER $$
CREATE TRIGGER t2
BEFORE INSERT ON Catalog
FOR EACH ROW
BEGIN
    IF 
		NEW.cost IS NULL 
    THEN
        SET NEW.cost = 10;  
    END IF;
END$$
DELIMITER ;
insert into CATALOG (sid,pid) values(10001, 20001);
select * from CATALOG;