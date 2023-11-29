-- 1.使用EMP資料表中的員工編號(empno),姓名(ename)及部門編號(deptno)來建立一個EMP_VU view,並將姓名(ename)欄位名稱改成EMPLOYEE。
CREATE VIEW emp_vu
AS
SELECT empno, ename EMPLOYEE, deptno
FROM emp;
DESC emp_vu;

-- 2.顯示EMP_VU view中的資料內容。
SELECT * FROM emp_vu;

-- 3.使用EMP_VU view來顯示所有員工之姓名及部門編號。
SELECT EMPLOYEE, deptno FROM emp_vu;

-- *4.新建一個名為DEPT20的view,包含在部門20的所有員工之員工編號，員工姓名，及部門編號。將View中的資料項目命名為EMPLOYEE_ID, EMPLOYEE, and DEPARTMENT_ID。並設定不允許使用者透過DEPT20來更改員工所屬的部門編號。
CREATE VIEW DEPT20
AS
SELECT empno EMPLOYEE_ID, ename EMPLOYEE, deptno DEPARTMENT_ID
FROM emp
WHERE deptno = 20
WITH CHECK OPTION;

-- 5.顯示DEPT20 view的欄位定義資料(結構)及其所有資料內容。
DESC DEPT20;
SELECT * FROM DEPT20;

-- 6.試試看利用DEPT20 view將Smith 轉調到部門30。
UPDATE DEPT20
SET DEPARTMENT_ID = 30
WHERE EMPLOYEE = "Smith";
SELECT * FROM DEPT20;

-- 7.新建一個名為SALARY_VU的view，包含所有員工之姓名，部門名稱，薪資和薪資等級。將View中的資料項目分別命名為Employee, Department, Salary, Grade。
CREATE VIEW SALARY_VU
AS
SELECT e.ename EMPLOYEE, d.dname Department, e.sal Salary, f.grade Grade
FROM emp e JOIN dept d ON e.deptno = d.deptno
		   JOIN salgrade f ON e.sal BETWEEN f.losal AND f.hisal;
SELECT * FROM SALARY_VU;

-- 8.在EMP資料表中利用ename欄位建立一個non-unique index 命名為idx_emp_ename。
CREATE INDEX idx_emp_ename ON emp(ename);
SHOW INDEX FROM emp;



