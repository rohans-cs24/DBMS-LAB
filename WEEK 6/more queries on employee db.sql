use emp;
SELECT 
    m.ename AS manager_name, 
    COUNT(e.empno) AS employee_count
FROM emp e, emp m
WHERE e.mgr_no = m.empno
GROUP BY m.empno, m.ename
HAVING COUNT(e.empno) = (
    SELECT MAX(sub.cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM emp
        WHERE mgr_no IS NOT NULL
        GROUP BY mgr_no
    ) AS sub
);
SELECT 
    m.ename AS manager_name, 
    m.sal AS manager_salary
FROM emp m
WHERE m.empno IN (SELECT mgr_no FROM emp) -- Ensures they are actually a manager
  AND m.sal > (
      SELECT AVG(e.sal) 
      FROM emp e 
      WHERE e.mgr_no = m.empno
  );
SELECT 
    e.empno,
    d.deptno
FROM emp e, dept d
WHERE e.deptno = d.deptno
  AND (e.mgr_no IS NULL OR e.empno IN (7698, 7839, 7566))
ORDER BY d.deptno;

SELECT *
FROM emp e, incentives i
WHERE e.empno = i.empno
  AND i.incentive_date BETWEEN '2019-02-01' AND '2019-02-28'
  AND i.incentive_amount = (
      SELECT MAX(incentive_amount)
      FROM incentives
      WHERE incentive_date BETWEEN '2019-02-01' AND '2019-02-28'
        AND incentive_amount < (
            SELECT MAX(incentive_amount)
            FROM incentives
            WHERE incentive_date BETWEEN '2019-02-01' AND '2019-02-28'
        )
  );
  
  SELECT *
  FROM emp e1
  where e1.deptno = ( select e2.deptno
					  from emp e2
                      where e2.empno = e1.mgr_no);
                      
select distinct e.ename
from emp e, incentives i
where (select max(sal+incentive_amount)
	   from emp, incentives) >= any (select sal
									 from emp e1
                                     where e.deptno = e1.deptno);