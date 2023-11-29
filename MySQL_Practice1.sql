-- 1.建立一個查詢來顯示部門(dept)資料表中的所有資料。
SELECT * FROM dept;

-- 2.建立一個查詢來顯示每一位員工的姓名(name)、職稱(job)、進公司日期(hire date)及員工編號(employee number )，並將且員工編號顯示在最前面。
SELECT empno, ename, job, hiredate FROM emp;

-- 3.建立一個查詢來顯示所有員工所擔任的職稱有哪些?(重複的資料只顯示一次)
SELECT DISTINCT job FROM emp;
-- 4.建立一個查詢來顯示每一位員工的姓名(name)、職稱(job)、進公司日期(hire date)及員工編號(employee number )，並將且員工編號顯示在最前面。並將資料表頭重新命名為：Emp#, Employee, Job, Hire Date。
SELECT empno "Emp#", ename Employee, job Job, hiredate "Hire Date" FROM emp;

-- 5.建立一個查詢將姓名(name)及職稱(job)串接為依個資料項(資料中間利用一個空白和一個逗號做區隔)，並將表頭重新命名為Employee and Title。
SELECT CONCAT(ename, ", ", job) "Employee and Title" FROM emp;