SELECT *FROM production.products
SELECT *FROM sales.orders
SELECT *FROM sales.order_items
SELECT *FROM sales.customers
SELECT *FROM sales.staffs


-- 5.Create a view that shows the product details along with the total sales quantity and revenue for each product.
CREATE VIEW sales.product_info
AS 
SELECT product_name, brand_name ,list_price  
FROM production.products p
INNER JOIN  sales.order_items o
ON  p.list_price=o.list_price


-
-- 4.To find the top 5 customers who have placed the most orders, you can use the following SQL query:

SELECT TOP 5
  customer_id,
  COUNT(*) AS order_count
FROM
  sales.customers
GROUP BY
  customer_id
ORDER BY
  order_count DESC;

  --3.Write a stored procedure that accepts a customer ID and returns the total number of orders placed by that customer.
  CREATE PROCEDURE GetCustomersOrderCount
  @customerID INT,
  @orderCount INT OUTPUT
AS
BEGIN
  SELECT
    @orderCount = COUNT(*)
  FROM
    sales.customers
  WHERE
    customer_id = @customerID;
END;
DECLARE @count INT;
EXEC  GetCustomersOrderCount @customerID = 8, @orderCount = @count OUTPUT;
SELECT @count AS OrderCount;


--1.Write a query to retrieve the list of orders along with the customer name and staff name for each order.
SELECT c.customer_id, s.staff_id
FROM  sales.orders o
INNER JOIN  sales.customers c ON c.customer_id =o.customer_id
INNER JOIN  sales.staffs s ON s.staff_id =o.staff_id

 --Create a view that returns the total quantity and sales amount for each product.
 CREATE VIEW ProductSales AS
SELECT
  i.order_id,
  SUM(i.quantity) AS total_quantity,
  SUM(i.quantity * i.list_price) AS total_sales_amount
FROM
  sales.order_items i
GROUP BY
 i.order_id;

  SELECT *FROM ProductSales;
