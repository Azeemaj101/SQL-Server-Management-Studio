--CREATE LOAN_RECORD DATABASE
CREATE DATABASE LOAN_RECORD;

--USE LOAN_RECORD DATABASE
USE LOAN_RECORD;

--CREATE LOAN TABLE WITH THREE ATTRIBUTES
CREATE TABLE Loan(Loan_number VARCHAR(10) PRIMARY KEY,
				  branch_name VARCHAR(30) NOT NULL,
				  amount      INT         NOT NULL
				 );

--CREATE BORROWER TABLE WITH FOUR ATTRIBUTE AND ONE FOREIGN KEY
CREATE TABLE Borrower(CustomerID      INT IDENTITY(1,1) PRIMARY KEY,
					  CUSTOMER_NAME   VARCHAR(15) NOT NULL,
					  Customer_street VARCHAR(25) NOT NULL,
					  LOAN_NUMBER	VARCHAR(10) FOREIGN KEY REFERENCES Loan(Loan_number)
					 );

--INSERT DATA IN LOAN TABLE
INSERT INTO Loan VALUES('L-14','Downtown',15000);
INSERT INTO Loan VALUES('L-11','Round Hill',16000);
INSERT INTO Loan VALUES('L-15','Perryridge',15000);
INSERT INTO Loan VALUES('L-16','Perryridge',13000);
INSERT INTO Loan VALUES('L-17','Maintown',2000);
INSERT INTO Loan VALUES('L-23','Redwood',2000);
INSERT INTO Loan VALUES('L-93','Round Hill',900);

--INSERT DATA IN BORROWER TABLE IGNORE ID ATTRIBUTE BECAUSE THIS IS IDENTITY
INSERT INTO Borrower VALUES('Adams','main town','L-16');
INSERT INTO Borrower VALUES('Curry','down main','L-93');
INSERT INTO Borrower VALUES('Hayes','harrison','L-11');
INSERT INTO Borrower VALUES('Jones','pittsfield','L-17');
INSERT INTO Borrower VALUES('Smith','woodside','L-11');
INSERT INTO Borrower VALUES('Smith','rockside','L-23');
INSERT INTO Borrower VALUES('Williams','palo alto','L-17');

--*********************************************************--
--***********A tuple is one record (one row)***************--

--1. List the tuples of borrower relation
SELECT *FROM Borrower;

--2. List the tuples of Loan relation
SELECT *FROM Loan;

--3. Find the names of all branches in the loan relation
SELECT branch_name FROM Loan;

--4. Find the distinct name of all branches in the loan relation
SELECT DISTINCT branch_name FROM Loan;

--5. Find all loan numbers for the loans made at Perryridge branch with amount greater than $1200.
SELECT LOAN_NUMBER FROM Loan WHERE branch_name = 'Perryridge' AND amount > 1200;

--6. Find the loan number of those loans with loan amount between 900 and 13000
SELECT LOAN_NUMBER FROM Loan WHERE amount BETWEEN 900 AND 13000;

--7.List the entire loan relation in descending order of amount 
--and if several loans have the same amount then order them in
--ascending order by loan number.
SELECT *FROM Loan order by amount DESC, Loan_number ASC;

--8. For all customers who have a loan from the bank, find their names, loan numbersrenamed as loan_id and loan amount.
SELECT CUSTOMER_NAME, Borrower.LOAN_NUMBER AS loan_id, amount 
FROM Borrower,Loan 
WHERE Borrower.LOAN_NUMBER = Loan.Loan_number;

--9. Find the names of all customers whose street address includes substring 'Main';.
SELECT CUSTOMER_NAME FROM Borrower WHERE Customer_street LIKE '%main%';

--10. Find the customer names, loan numbers and loan amounts for all loans at the Perryridge Branch.
SELECT CUSTOMER_NAME, Borrower.LOAN_NUMBER, amount FROM Borrower,Loan 
WHERE (Borrower.LOAN_NUMBER = Loan.Loan_number) AND branch_name = 'Perryridge';

--11.Find all customers name that has taken loan from Perryridge branch.
SELECT CUSTOMER_NAME FROM Borrower,Loan 
WHERE (Borrower.LOAN_NUMBER = Loan.Loan_number) AND branch_name = 'Perryridge';

--12. Violate the primary key constraint on Loan table.
INSERT INTO Loan VALUES('L-93','Round Hill',900); --ERROR BECAUSE L-93 Loan already inserted

--13. violate the foreign key constraint on customers table.
INSERT INTO Borrower VALUES('Williams','palo alto','L-100'); --L-100 is not available in loan table

--14. Find the Name of the customers that has got loan between 900 and 3000.
SELECT CUSTOMER_NAME FROM Loan, Borrower WHERE Loan.Loan_number = Borrower.LOAN_NUMBER AND amount BETWEEN 900 AND 13000;

--15.Find the name of customers that belong to street like main.
SELECT CUSTOMER_NAME FROM Borrower WHERE Customer_street LIKE '%main%';
