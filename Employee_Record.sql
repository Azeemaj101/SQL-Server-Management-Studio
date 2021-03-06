CREATE DATABASE EMPLOYEE;
USE EMPLOYEE;
CREATE TABLE EMPLOYEE_INFO
(EMPID INTEGER PRIMARY KEY,
EMPNAME VARCHAR(20) NOT NULL,
EMPSALARY INT NOT NULL,
JOB VARCHAR(20),
PHONE BIGINT,
DEPID INTEGER);

INSERT EMPLOYEE_INFO VALUES(1,'AZEEM',500,'PROGRAMMER',0324404060,10);
INSERT EMPLOYEE_INFO(EMPID,EMPNAME,EMPSALARY) VALUES(2,'JAVARIA',400);
UPDATE EMPLOYEE_INFO SET JOB = 'DEVELOPER' WHERE EMPNAME = 'JAVARIA';
UPDATE EMPLOYEE_INFO SET EMPSALARY = EMPSALARY + 1000 WHERE EMPNAME = 'AZEEM';
UPDATE EMPLOYEE_INFO SET PHONE = 0345424784 WHERE EMPNAME ='JAVARIA'; 
UPDATE EMPLOYEE_INFO SET DEPID = 11 WHERE EMPNAME = 'JAVARIA';
INSERT EMPLOYEE_INFO VALUES(3,'javaria',200,'PROGRAMMER1',0444064060,12);
DELETE FROM EMPLOYEE_INFO WHERE EMPNAME ='JAVARIA';
SELECT *FROM EMPLOYEE_INFO  ORDER BY EMPSALARY;
SELECT SUM(EMPSALARY) FROM EMPLOYEE_INFO;