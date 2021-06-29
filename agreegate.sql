SELECT *FROM production.products;
SELECT Min(list_price)AS MINS from production.products;
SELECT Max(list_price)AS MAXS from production.products;
SELECT AVG(list_price)AS AVGS from production.products;
SELECT SUM(list_price)AS SUMS from production.products;
SELECT COUNT(list_price)AS COUNTS from production.products;

UPDATE production.products SET model_year = null where product_id = 1;

SELECT COUNT(*) AS COUNTS from production.products;
SELECT COUNT(model_year) AS COUNTS from production.products;
SELECT COUNT(DISTINCT model_year) AS COUNTS from production.products;

SELECT DISTINCT model_year AS COUNTS from production.products;

QUIZ

CREATE DATABASE QUIZDB;
USE QUIZDB;
CREATE TABLE Customer_T(C_ID INT IDENTITY(1,1) PRIMARY KEY,

FIRST_NAME VARCHAR(20) NOT NULL,
LAST_NAME VARCHAR(25) NOT NULL,
CITY VARCHAR(25) DEFAULT 'LHR');

CREATE TABLE Order_T(Order_ID INT PRIMARY KEY,

Item_NAME VARCHAR(20) NOT NULL,
Item_Quantity INT NOT NULL,
Price_Per_Item int not null,
C_ID INT FOREIGN KEY REFERENCES

Customer_T(C_ID));

INSERT INTO Customer_T VALUES ('ALI','Aslam',DEFAULT);
INSERT INTO Customer_T VALUES ('Arshad','Ali','KHR');
INSERT INTO Customer_T VALUES ('Salman','Shahid','Pindi');
INSERT INTO Customer_T VALUES ('Akram','Khan','Lahore');
SELECT *FROM Customer_T;
INSERT INTO Order_T VALUES (2,'Mouse',40,15000,002);
INSERT INTO Order_T VALUES (3,'Laptop',1,30000,003);
INSERT INTO Order_T VALUES (4,'Speaker',3,2500,004);
INSERT INTO Order_T VALUES (5,'Keyboard',5,10000,002);
INSERT INTO Order_T VALUES (6,'Monitor',10,25000,001);
--4. Try to violate the Primary key Constraint.
--5. Try to violate Foreign key Constraint.
INSERT INTO Order_T VALUES(1,'USB',30,20000,001);
INSERT INTO Customer_T VALUES(1,'BOOK',2,200,1);
--6. Drop foreign key
ALTER TABLE Order_T DROP CONSTRAINT FK__Order_T__C_ID__398D8EE0E;
--7.Add Foreign key again on Order_T
ALTER TABLE Order_T
ADD FOREIGN KEY (C_ID) REFERENCES Customer_T(C_ID);
--8. Delete Order_id 5
DELETE Order_T WHERE C_ID = 5;
--9. Find the name of all Customers belonging to Lahore
SELECT FIRST_NAME FROM Customer_T
WHERE City = 'Lahore';
--10. Find the names of items whose value range from 15000 and 20000
SELECT FIRST_NAME FROM Customer_T,Order_T
WHERE Price_Per_Item between 15000 and 20000;
--11. Find names of items whose values are not 15000 ,20000 and 2500
SELECT FIRST_NAME FROM Customer_T,Order_T
WHERE Price_Per_Item not in(15000, 20000,2500);

--12. Find names of Items whose value is 30000 and 15000
SELECT FIRST_NAME FROM Customer_T,Order_T
WHERE Price_Per_Item not in(30000, 15000);
--13. Find names of customers whose first name starts from ‘A’.
SELECT FIRST_NAME FROM Customer_T
WHERE FIRST_NAME like 'A%';
--14. Find names of customers whose first name ends with ‘n’.
SELECT FIRST_NAME FROM Customer_T
WHERE FIRST_NAME like '%n';
--15. Find price per item of the items named mouse, speaker and laptop.
SELECT Price_Per_Item FROM Order_T
WHERE Item_NAME in('mouse', 'speaker','laptop');
--16. Find all the item names except usb.
SELECT Price_Per_Item FROM Order_T
WHERE Item_NAME in('usb');
--17. Return customer’s data only belonging to Lahore.
SELECT *FROM Customer_T
WHERE CITY = 'Lahore';
--18. Arrange Order__T in ascending order on the basis of most items are sold.
SELECT *FROM Order_T
ORDER BY Item_NAME ASC;
--19. Return tuples from Customer_T relation where customer belong to Lahore and arrange
it in descending order.
SELECT *FROM Customer_T
WHERE CITY = 'Lahore'
ORDER BY FIRST_NAME DESC;
--20. Drop Both the tables i.e Customer_T and Order_T
DROP TABLE Customer_T, Order_T;