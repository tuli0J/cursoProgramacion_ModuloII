
SELECT * FROM customers;
SELECT * FROM customers WHERE Country = 'Mexico';
SELECT * FROM customers WHERE Country = 'USA' AND City = 'Boise';
SELECT * FROM customers WHERE Country IN('USA', 'Mexico');
SELECT * FROM customers WHERE Country IN('USA', 'Mexico') ORDER BY Country ASC;
SELECT * FROM customers WHERE Country IN('USA', 'Mexico') ORDER BY Country DESC;

SELECT * FROM products;
SELECT * FROM products WHERE Price > 20 ORDER BY CategoryID;
SELECT * FROM products WHERE Price > 20 ORDER BY CategoryID, Price;
SELECT * FROM products WHERE Price >= 20 and Price <= 50;

SELECT * FROM orders;
SELECT * FROM orders where OrderDate = '1996-07-08';
SELECT * FROM orders where OrderDate = '19960708';
SELECT * FROM orders where OrderDate = '1996/07/08';
SELECT * FROM orders where OrderDate BETWEEN '19960704' AND '19960724';
SELECT * FROM orders where OrderDate BETWEEN '19960704' AND '19960724' AND EmployeeID IN (3, 4) ORDER BY EmployeeID;


SELECT * from employees WHERE FirstName LIKE '%la%';
SELECT * from employees WHERE FirstName LIKE 'la%';
SELECT * from employees WHERE FirstName LIKE '%ven';
SELECT * from employees WHERE FirstName LIKE 'na%' OR FirstName LIKE 'mi%';

select OrderID, CustomerID AS IDCLIENTE, (SELECT CustomerName FROM customers where CustomerID = orders.CustomerID) AS Cliente
from orders;

SELECT O.OrderID, O.OrderDate, CU.CustomerName AS Cliente, 
CONCAT(em.FirstName, ' ', em.LastName) AS Empleado,  
sh.ShipperName Repartidor
FROM orders AS O
INNER JOIN customers AS CU ON O.CustomerID = CU.CustomerID
INNER JOIN employees AS em ON em.EmployeeID = O.EmployeeID
INNER JOIN shippers AS sh ON sh.ShipperID = O.ShipperID;


SELECT count(*) AS CANTIDAD FROM orders WHERE EmployeeID = 4;
SELECT count(*) AS CANTIDAD FROM orders WHERE CustomerID = 5;

SELECT C.CategoryName AS CATEGORIA, SUM(OD.Quantity * P.Price) AS TOTAL FROM categories AS C
INNER JOIN products AS P ON P.CategoryID = C.CategoryID
INNER JOIN orderdetails AS OD ON OD.ProductID = P.ProductID
GROUP BY C.CategoryName;


SELECT 
C.CategoryName AS CATEGORIA, 
CASE 
	WHEN O.EmployeeID = 4 THEN SUM(OD.Quantity * P.Price)
    WHEN O.EmployeeID = 8 THEN SUM(OD.Quantity * P.Price)
    ELSE 0
END AS TOTAL

FROM categories AS C
INNER JOIN products AS P ON P.CategoryID = C.CategoryID
INNER JOIN orderdetails AS OD ON OD.ProductID = P.ProductID
INNER JOIN orders AS O ON O.OrderID = OD.OrderID
GROUP BY C.CategoryName, O.EmployeeID;

INSERT INTO customers (CustomerName, customers.ContactName, customers.Address, customers.City, customers.PostalCode, customers.Country)
VALUES ('Nahum Casco', 'Nahum', NULL, 'Berlin', 12209, 'Germany');

SELECT * FROM customers WHERE Address IS NULL;
SELECT * FROM customers WHERE Address IS NOT NULL;

SELECT * FROM customers order by CustomerID DESC limit 10;

SELECT MAX(OrderDate) FROM orders;
SELECT MIN(OrderDate) FROM orders;

SELECT AVG(Price) FROM products;


set global log_bin_trust_function_creators = 1

DELIMITER $$
CREATE FUNCTION HOLA()
RETURNS VARCHAR(20)
BEGIN
	RETURN  'Hola Mundo';
END;$$
DELIMITER ;

SELECT Hola();

SELECT employees.FirstName, TIMESTAMPDIFF(YEAR, employees.BirthDate, CURDATE()) AS edad, employees.BirthDate FROM employees;


DELIMITER $$
CREATE FUNCTION DameEdad(idEmpleado integer) RETURNS INTEGER
BEGIN
	declare edad Integer;
    set edad = (select TIMESTAMPDIFF(YEAR, employees.BirthDate, CURDATE()) FROM employees where EmployeeID = idEmpleado);
	RETURN edad;
END;$$

DELIMITER ;

select A.FirstName, DameEdad(A.EmployeeID) edad from employees AS A














