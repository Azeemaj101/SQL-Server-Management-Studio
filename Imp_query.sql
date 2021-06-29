--SELECT distinct first_name, last_name FROM sales.customers order by first_name asc;
--SELECT distinct phone FROM sales.customers order by phone asc;
--SELECT product_id,product_name,category_id,model_year,list_price FROM production.products WHERE category_id = 1 and model_year = 2018 ORDER BY list_price DESC;
--SELECT list_price,model_year from production.products WHERE list_price > 3000 OR model_year = 2018 ORDER BY list_price ASC;
--SELECT brand_id+100 as aj from production.products where brand_id <> 9;
--SELECT *FROM STUDENT;

--INSERT INTO STUDENT VALUES(1,'AZEEM','JAVED','HOME','LAHORE',0324,200);

--ALTER TABLE STUDENT ADD AD INT NULL CONSTRAINT AJ UNIQUE;

--ALTER TABLE STUDENT DROP COLUMN AD1;

--ALTER TABLE STUDENT DROP CONSTRAINT AJ, COLUMN AD;

--SELECT *FROM sales.customers WHERE customer_id IN (1, 2, 3);
--SELECT distinct phone, first_name FROM sales.customers WHERE first_name BETWEEN 'A' AND 'C' ORDER BY first_name ASC;

SELECT *FROM sales.orders WHERE order_date BETWEEN '2016-01-01' AND '2016-01-03';
