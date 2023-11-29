-- 1.顯示所有員工之姓名、所屬部門編號、部門名稱及部門所在地點。
select e.ename, e.deptno, d.dname, d.loc 
from emp e join dept d on e.deptno = d.deptno;

-- 2.顯示所有有賺取佣金的員工之姓名、佣金金額、部門名稱及部門所在地點。
select e.ename, e.comm, d.dname, d.loc 
from emp e join dept d on e.deptno = d.deptno 
where comm > 0;

-- 3.顯示姓名中包含有”A”的員工之姓名及部門名稱。
select e.ename, d.dname 
from emp e join dept d on e.deptno = d.deptno
where ename like'%A%';

-- 4.顯示所有在”DALLAS”工作的員工之姓名、職稱、部門編號及部門名稱
select e.ename, e.job, e.deptno, d.dname 
from emp e join dept d on e.deptno = d.deptno
where d.loc = 'DALLAS';

-- 5.顯示出表頭名為:Employee, Emp#, Manager, Mgr#，分別表示所有員工之姓名、員工編號、主管姓名、主管的員工編號。
select e.ename Employee, e.empno 'Emp#', d.ename Manager, d.empno 'Mgr#'
from emp e join emp d on e.mgr = d.empno;

-- 6.顯示出SALGRADE資料表的結構，並建立一查詢顯示所有員工之姓名、職稱、部門名稱、薪資及薪資等級。
select e.ename, e.job, d.dname, e.sal, f.grade
from emp e join dept d on e.deptno = d.deptno
		   join salgrade f on e.sal between f.losal and f.hisal;

-- 7.顯示出表頭名為: Employee, EmpHiredate, Manager, MgrHiredate的資料項，來顯示所有比他的主管還要早進公司的員工之姓名、進公司日期和主管之姓名及進公司日期。
select e.ename Employee, e.hiredate EmpHiredate, d.ename Manager, d.hiredate MgrHiredate
from emp e join emp d on e.mgr = d.empno
where e.hiredate < d.hiredate;

-- 8.顯示出表頭名為: dname, loc, Number of People, Salary的資料來顯示所有部門之部門名稱、部門所在地點、部門員工數量及部門員工的平均薪資，平均薪資四捨五入取到小數第二位。
select d.dname, d.loc, count(*) 'Number of People', round(avg(sal), 2) Salary
from dept d join emp e on d.deptno = e.deptno
group by dname, loc;

-- 9.*顯示出所有部門之編號、名稱及部門員工人數(Emp#)，包含沒有員工的部門。
select d.deptno, d.dname, count(e.ename)
from dept d left outer join emp e on d.deptno = e.deptno
group by deptno, dname;

