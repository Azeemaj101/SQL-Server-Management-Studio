ALTER PROC uspfindproducts (@min_list_price as decimal, @max_list_price AS DECIMAL)
AS
BEGIN
	SELECT product_name,list_price from production.products
	where list_price >= @min_list_price AND list_price <= @max_list_price
	ORDER BY list_price 
END 
GO

EXEC uspfindproducts @max_list_price =  1000,@min_list_price = 100