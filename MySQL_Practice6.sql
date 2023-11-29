-- 1.顯示和Blake同部門的所有員工之姓名和進公司日期。
SELECT ename, hiredate 
FROM emp 
WHERE deptno = (SELECT deptno FROM emp WHERE ename = 'Blake');

-- 2.顯示所有在Blake之後進公司的員工之姓名及進公司日期。
SELECT ename, hiredate 
FROM emp 
WHERE hiredate > (SELECT hiredate FROM emp WHERE ename = 'Blake');

-- 3.顯示薪資比公司平均薪資高的所有員工之員工編號,姓名和薪資，並依薪資由高到低排列。
SELECT empno, ename, sal
FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp)
ORDER BY sal DESC;

-- 4.顯示和姓名中包含T的人在相同部門工作的所有員工之員工編號和姓名。
SELECT empno, ename
FROM emp
WHERE deptno IN (SELECT deptno FROM emp WHERE ename LIKE '%T%');

-- 5.顯示在Dallas工作的所有員工之姓名, 部門編號和職稱。
SELECT e.ename, e.deptno, e.job
FROM emp e JOIN dept d ON e.deptno = d.deptno
WHERE d.loc = 'Dallas';

-- 6.顯示直屬於”King”的員工之姓名和薪資。
SELECT e.ename, e.sal
FROM emp e JOIN emp d ON e.mgr = d.empno
WHERE d.ename = 'King';

-- 7.顯示銷售部門”Sales” 所有員工之部門編號,姓名和職稱。
SELECT e.deptno, e.ename, e.job
FROM emp e JOIN dept d ON e.deptno = d.deptno
WHERE d.dname = 'Sales';

-- 8.顯示薪資比公司平均薪資還要高且和名字中有T的人在相同部門上班的所有員工之員工編號,姓名和薪資。
SELECT empno, ename, sal
FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp) 
AND deptno IN (SELECT deptno FROM emp WHERE ename LIKE '%T%');

-- 9.顯示和有賺取佣金的員工之部門編號和薪資都相同的員工之姓名,部門編號和薪資。
SELECT ename, deptno, sal
FROM emp
WHERE comm > 0
AND sal IN (SELECT sal FROM emp GROUP BY sal HAVING count(*) >= 2);

-- 10.顯示和在Dallas工作的員工之薪資和佣金都相同的員工之姓名,部門編號和薪資。
SELECT e.ename, e.deptno, e.sal
FROM emp e JOIN dept d ON e.deptno = d.deptno
WHERE d.loc = 'Dallas'
AND (sal, ifnull(comm, 0)) IN (SELECT sal, ifnull(comm, 0) 
FROM emp GROUP BY sal, comm HAVING count(*) >= 2);

-- 11.顯示薪資和佣金都和Scott相同的所有員工之姓名,進公司日期和薪資。(不要在結果中顯示Scott的資料)
SELECT ename, hiredate, sal
FROM emp
WHERE (sal, ifnull(comm, 0)) = (SELECT sal, ifnull(comm, 0) FROM emp WHERE ename = 'Scott') AND ename != 'Scott';

-- 12.顯示薪資比所有職稱是”Clerk”還高的員工之姓名,進公司日期和薪資，並將結果依薪資由高至低顯示。
SELECT ename, hiredate, sal 
FROM emp
WHERE sal > ALL (SELECT sal FROM emp WHERE job = 'Clerk')
ORDER BY sal DESC;

