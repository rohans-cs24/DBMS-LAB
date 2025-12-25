use supplierdb;
SELECT DISTINCT P.pname
FROM Parts P, Catalog C
WHERE P.pid = C.pid;


SELECT S.sname
FROM Supplier S
WHERE (( SELECT count(P.pid)
		 FROM Parts P ) = ( SELECT count(C.pid)
							 FROM Catalog C
							 WHERE C.sid = S.sid ));

SELECT S.sname
FROM Supplier S
WHERE (( SELECT count(P.pid)
         FROM Parts P 
         where color='Red' ) = ( SELECT count(C.pid)
								 FROM Catalog C, Parts P
								 WHERE C.sid = S.sid 
                                 AND C.pid = P.pid 
                                 AND P.color = 'Red' ));
                                 

SELECT P.pname
FROM Parts P, Catalog C, Supplier S
WHERE P.pid = C.pid 
AND C.sid = S.sid
AND S.sname = ' Acme Widget'
AND NOT EXISTS ( SELECT *
				 FROM Catalog C1, Supplier S1
				 WHERE P.pid = C1.pid 
                 AND C1.sid = S1.sid 
                 AND S1.sname <> ' Acme Widget');

SELECT DISTINCT C.sid 
FROM Catalog C
WHERE C.cost > ( SELECT AVG (C1.cost)
				 FROM Catalog C1
				 WHERE C1.pid = C.pid );
							
SELECT P.pid, S.sname
FROM Parts P, Supplier S, Catalog C
WHERE C.pid = P.pid
AND C.sid = S.sid
AND C.cost = (SELECT max(C1.cost)
			  FROM Catalog C1
			  WHERE C1.pid = P.pid);


