--1. List the tuples of borrower relation
SELECT *FROM Borrower;

--2. List the tuples of Loan relation
SELECT *FROM Loan;

SELECT CUSTOMER_NAME,branch_name FROM Borrower,Loan WHERE Borrower.LOAN_NUMBER = Loan.Loan_number;

SELECT customer_id, YEAR(order_date) order_year FROM sales.orders where order_id IN (1,2) GROUP BY order_id,quantity;

SELECT customer_id, YEAR(order_date) AS YEARS from sales.orders where customer_id in (1,2) GROUP BY customer_id,YEAR(order_date) order by customer_id asc; 

SELECT *FROM MEMBERS_INFO;

SELECT *FROM sales.orders order by customer_id asc;

SELECT AVG(SALARY) AS AVG_SALARY, GENDER FROM MEMBERS_INFO GROUP BY GENDER ORDER BY GENDER;

SELECT COUNT(GENDER) AS COUNT_GENDER, GENDER, CITY FROM MEMBERS_INFO GROUP BY CITY, GENDER ORDER BY CITY;

--SELECT AVG(SALARY) AS AVG_SALARY FROM MEMBERS_INFO GROUP BY MARITAL_STATUS,SALARY ORDER BY CITY;
 SELECT COUNT(*) AS CITYS, CITY FROM MEMBERS_INFO GROUP BY CITY ORDER BY CITY;

 SELECT GENDER,MARITAL_STATUS,AVG(SALARY) AS SALARY_ FROM MEMBERS_INFO GROUP BY GENDER , MARITAL_STATUS ORDER BY GENDER;

 SELECT CITY,GENDER , COUNT(*) FROM MEMBERS_INFO WHERE M_NAME = 'AZEEM' GROUP BY CITY, GENDER ORDER BY CITY;
 
 SELECT M_NAME,CITY FROM MEMBERS_INFO WHERE CITY IS NOT NULL; 

 SELECT COUNT(M_ID) ,CITY FROM MEMBERS_INFO GROUP BY CITY HAVING COUNT(M_ID) > 1;
 
 SELECT AVG(SALARY) AS AVG_ ,CITY FROM MEMBERS_INFO GROUP BY CITY HAVING AVG(SALARY) > 500;

 SELECT CITY,AVG(SALARY) AS AVGS FROM MEMBERS_INFO GROUP BY CITY HAVING AVG(SALARY) > 500;






