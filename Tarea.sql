/*Devolver los últimos 5 clientes que realizaron órdenes*/
SELECT c.* 
FROM customers AS c 
INNER JOIN orders AS o ON o.CustomerID = c.CustomerID 
ORDER BY o.OrderID DESC LIMIT 5;

/*Devolver todos los clientes que son de Francia que ha realizado
ordenes de productos que pertenecen a la categoría: Beverages.*/
SELECT
cu.CustomerName AS Cliente, cu.Country = 'France',
ca.CategoryID AS Categoria, ca.CategoryName = 'Bevarages'
FROM orders AS o 
INNER JOIN customers AS cu ON cu.CustomerID = o.CustomerID
INNER JOIN categories AS ca ON cu.CustomerID = o.CustomerID;

/*Devolver los productos que han sido entregados por el
transportista (shippers): Speedy Express.*/
SELECT DISTINCT* 
FROM shippers AS s
INNER JOIN orders  AS o ON o.shipperID = s.ShipperID
INNER JOIN orderdetails AS od ON od.OrderID = o.OrderID
INNER JOIN products AS p ON p.ProductID = od.ProductID
WHERE s.ShipperName = 'Speedy Express' Order by ProductID;











