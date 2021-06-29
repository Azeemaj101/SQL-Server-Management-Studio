CREATE DATABASE DB_QUIZ_2;
USE DB_QUIZ_2;

CREATE TABLE EMPLOYEE(EmployeeId INT IDENTITY(1,1) PRIMARY KEY,
					  Name VARCHAR(30) NOT NULL,
					  Gender VARCHAR(30) CHECK(GENDER = 'MALE' OR GENDER = 'FEMALE'),
					  salary INT NOT NULL,
					  City VARCHAR(30) DEFAULT 'LAHORE',
					  DepartmentId INT FOREIGN KEY REFERENCES DEPARTMENT(DepartmentId));

CREATE TABLE DEPARTMENT(DepartmentId INT IDENTITY(1,1) PRIMARY KEY,
						 Name VARCHAR(50) NOT NULL);

INSERT INTO DEPARTMENT (NAME) VALUES('ACCOUNTS'),('HR'),('ADMINISTRATION'),('FACULTY');

INSERT INTO EMPLOYEE (Name, Gender, salary, City,DepartmentId) 
VALUES('RABAIL','FEMALE',25000,'SIALKOT',4),
	  ('MANZAR','MALE',45000,'KARACHI',2),
	  ('ANUM','FEMALE',40000,'MULTAN',2),
	  ('SHAKEEL','MALE',65000,'LAHORE',1),
	  ('NOUMAN','MALE',35000,'KARACHI',3),
	  ('SARA','FEMALE',70000,'MULTAN',3),
	  ('SABIR','MALE',30000,'KARACHI',1),
	  ('AMNA','FEMALE',25000,'LAHORE',4),
	  ('MINHAL','MALE',35000,'MULTAN',1),
	  ('USMAN','MALE',50000,'LAHORE',1),
	  ('AMIR','MALE',55000,'LAHORE',4);

--QUERY1 = Display the empid, name, department name that the departments are same in both employee and department.
SELECT E.EmployeeId,E.Name, D.Name FROM EMPLOYEE E INNER JOIN DEPARTMENT D ON E.DepartmentId = D.DepartmentId;

--QUERY2 = Display employee name, city of the employees whose departmentId is same as that of employeeId 7.
SELECT E.Name, E.City FROM EMPLOYEE E INNER JOIN DEPARTMENT D ON E.DepartmentId = D.DepartmentId WHERE E.EmployeeId = 7;

--QUERY3 = Write a query that return number of rows as total where salary is greater than 50000.
SELECT COUNT(SALARY) AS TOTAL_ROWS FROM EMPLOYEE WHERE SALARY > 50000;

--QUERY4 = Write a query to display departmentId, min of salaries as lowest salaries for each departmentId.
SELECT salary, departmentid  FROM employee  
WHERE salary IN ( SELECT MIN(salary) FROM employee GROUP BY departmentid);

--QUERY5 = Display employees whose salary is greater than the HR department highest salary.
SELECT * FROM employee 
WHERE salary > 
ALL(SELECT avg(salary)FROM employee GROUP BY departmentid);