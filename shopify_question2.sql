# Shopify Data Challenge
# Question 2 - SQL
# Richard Chen


# 2.a
SELECT COUNT(*)
FROM Orders
WHERE ShipperID = (SELECT ShipperID
                    FROM Shippers
                    WHERE ShipperName = 'Speedy Express');
# ans: 54




# 2.b
SELECT *
FROM
  (SELECT Employees.EmployeeID, Employees.LastName, COUNT(*) AS TotalOrders
  FROM Orders
  INNER JOIN Employees ON Employees.EmployeeID=Orders.EmployeeID
  GROUP BY Employees.EmployeeID, LastName)
ORDER BY TotalOrders DESC

# ans: Peacock, 40 orders



# 2.c
SELECT TOP 1 *
FROM
  (SELECT Products.ProductName, SUM(OrderDetails.Quantity) AS ProductTotals
  FROM (((Orders
  INNER JOIN Customers ON Customers.CustomerID=Orders.CustomerID)
  INNER JOIN OrderDetails ON OrderDetails.OrderID=Orders.OrderID)
  INNER JOIN Products ON Products.ProductID=OrderDetails.ProductID)
  WHERE Country='Germany'
  GROUP BY Products.ProductName)
ORDER BY ProductTotals DESC;

# Boston Crab Meat, 160 units











