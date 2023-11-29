-- 1.將下列的資料新增至MY_EMP 資料表中,不要列舉欄位。
INSERT INTO MY_EMP
VALUES(1, "Patel", "Ralph", "rpatel", 795);

-- -2.使用列舉欄位方式,將下列的資料新增至MY_EMP資料表中。
INSERT INTO MY_EMP (id, last_name, first_name, userid, salary)
VALUES(2, "Dancs", "Betty", "bdancs", 860);

-- 3.將下列的資料新增至MY_EMP資料表中。
INSERT INTO MY_EMP
VALUES( 3, "Biri", "Ben", "bbiri", 11004),
	(4, "Newman", "Chad", "cnewman", 750);
SELECT * FROM MY_EMP;

-- 4.將員工編號為3的名字(last name)更改為Drexler。
-- 需有[SET SQL_SAFE_UPDATES = 0;]
SET SQL_SAFE_UPDATES = 0;
UPDATE MY_EMP
SET last_name = "Drexler"
WHERE ID = 3;
SELECT * FROM MY_EMP;

-- 5.將薪資低於900元的所有員工薪資調整為1000元。
UPDATE MY_EMP
SET salary = 1000
WHERE salary < 900;
SELECT * FROM MY_EMP;

-- 6.刪除Betty Dancs的資料。
DELETE FROM MY_EMP
WHERE last_name = "Dancs" AND first_name = "Betty";
SELECT * FROM MY_EMP;

-- 7. 啟動依個資料庫交易將所有員工的薪資調升10%,設定一個交易儲存點,刪除所有MY_EMP資料表中的資料,確認資料已被你刪光了,放棄刪除資料的動作,確認交易
START TRANSACTION;
UPDATE MY_EMP
SET salary = salary * 1.1;
SAVEPOINT Del_MY_EMP;
DELETE FROM MY_EMP;
ROLLBACK TO Del_MY_EMP;
SELECT * FROM MY_EMP;

