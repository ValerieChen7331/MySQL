-- 1.顯示所有員工的最高、最低、總和及平均薪資，依序將表頭命名為Maximum, Minimum, Sum和Average，請將結果顯示為四捨五入的整數。
SELECT  ROUND(MAX(sal)) Maximum, ROUND(MIN(sal)) Minimum, ROUND(SUM(sal)) Sum, ROUND(AVG(sal)) Average FROM emp;
-- 2.顯示每種職稱的最低、最高、總和及平均薪水。
SELECT  job, MAX(sal) Maximum, MIN(sal) Minimum, SUM(sal) Sum, AVG(sal) Average FROM emp GROUP BY job;
-- 3.顯示每種職稱的人數。
SELECT job, count(*) FROM emp GROUP BY job;
-- *4.顯示資料項命名為Number of Managers來表示擔任主管的人數。
SELECT COUNT(DISTINCT mgr) 'Number of Managers' FROM emp;
-- 5.顯示資料項命名為DIFFERENCE的資料來表示公司中最高和最低薪水間的差額。
SELECT MAX(sal)-MIN(sal) DIFFERENCE FROM emp;
-- *6.顯示每位主管的員工編號及該主管下屬員工最低的薪資，排除沒有主管和下屬員工最低薪資少於1000的主管，並以下屬員工最低薪資作降冪排列。
SELECT mgr, COUNT(*), MIN(sal) FROM emp GROUP BY mgr HAVING mgr is not null and MIN(sal)>=1000 ORDER BY MIN(sal) DESC;
-- 7.顯示在2010,2011,2012,2013年進公司的員工數量，並給該資料項一個合適的名稱。
SELECT YEAR(hiredate) 'Hire Year', COUNT(*) 'Number Of People' FROM emp GROUP BY YEAR(hiredate);