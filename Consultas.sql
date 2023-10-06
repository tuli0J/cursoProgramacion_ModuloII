SELECT C.CategoryName AS CATEGORIA, sum(OD.Quantity * P.Price) AS TOTAL FROM categories AS C
INNER JOIN products AS P ON P.CategoryID = C.CategoryID
INNER JOIN orderdetails AS OD ON OD.ProductID = P.ProductID
GROUP BY C.CategoryName;

SELECT 
C.CategoryName AS CATEGORIA, 
CASE
	WHEN O.EmployeeID=4 THEN SUM(OD.Quantity * P.Price) 
    WHEN O.EmployeeID=8 THEN SUM(OD.Quantity * P.Price) 
    ELSE 0
END AS TOTAL 

FROM categories AS C
INNER JOIN products AS P ON P.CategoryID = C.CategoryID
INNER JOIN orderdetails AS OD ON OD.ProductID = P.ProductID
INNER JOIN orders AS O ON O.OrderID = OD.OrderID
GROUP BY C.CategoryName, O.EmployeeID;

