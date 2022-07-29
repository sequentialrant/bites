-- Introductory Problems --

-- 1.
SELECT * FROM Shippers;

-- 2.
SELECT CategoryName, Description
FROM Categories;

-- 3.
SELECT FirstName, LastName, HireDate 
FROM Employees
WHERE Title = 'Sales Representative';

-- 4.
SELECT FirstName, LastName, HireDate 
FROM Employees
WHERE Title = 'Sales Representatives' AND Country = 'USA';

-- 5.
SELECT OrderID, OrderDate
FROM Orders
WHERE EmployeeID = 5;

-- 6.
SELECT SupplierID, ContactName, ContactTitle
FROM Suppliers
WHERE ContactTitle <> 'Marketing Manager';

-- 7.
SELECT 
    ProductID, 
    ProductName
FROM Products
WHERE ProductName LIKE '%queso%';

-- 8.
SELECT 
    OrderID, 
    CustomerID, 
    ShipCountry
FROM Orders
WHERE ShipCountry = 'France' OR ShipCountry = 'Belgium';

-- 9.
SELECT OrderID, CustomerID, ShipCountry
FROM Orders
WHERE ShipCountry IN ('Brazil', 'Mexico', 'Argentina', 'Venezuela');

-- 10.
SELECT 
    FirstName, 
    LastName,
    Title,
    BirthDate
From Employees
ORDER BY BirthDate;

-- 11.
SELECT 
    FirstName, 
    LastName,
    Title,
    CAST(BirthDate AS date)
    /*CONVERT(date, BirthDate)*/ /*Two ways to convert: use CAST or CONVERT */
From Employees
ORDER BY BirthDate;

-- 12.
SELECT 
    FirstName, 
    LastName,
    CONCAT(FirstName, ' ', LastName) AS FullName
    -- FirstName + ' ' + LastName AS FullName
FROM Employees;

-- 13.
SELECT 
    OrderID,
    ProductID,
    UnitPrice,
    Quantity,
    UnitPrice * Quantity AS TotalPrice
FROM [Order Details]
Order BY OrderID, ProductID;

-- 14.
SELECT COUNT(CustomerID) AS TotalCustomers
FROM Customers;

-- 15.
SELECT 
    MIN(OrderDate) AS FirstOrderDate
FROM Orders;

-- 16.
SELECT Country
FROM Customers
WHERE CompanyName = 'Northwind'
GROUP BY Country;

-- 17.
SELECT 
    DISTINCT ContactTitle,
    COUNT(ContactTitle) AS Counts
FROM Customers
GROUP BY ContactTitle
ORDER BY Counts DESC;

-- 18.
SELECT 
    p.ProductID,
    p.ProductName,
    s.CompanyName
FROM Products p
JOIN Suppliers s
ON p.SupplierID = s.SupplierID
ORDER BY p.ProductID;

-- 19.
SELECT 
    o.OrderID,
    CAST(o.OrderDate AS date) AS OrderDate,
    s.CompanyName
FROM Orders o
JOIN Shippers s
ON s.ShipperID = o.ShipVia
WHERE o.OrderID < 10300;


-- Intermediate Problems --

-- 20.
SELECT 
    c.CategoryName AS CategoryName,
    COUNT(ProductID) AS TotalProducts
FROM Products p
JOIN Categories c
ON c.CategoryID = p.CategoryID
GROUP BY CategoryName
ORDER BY TotalProducts DESC;

-- 21.
SELECT 
    Country,
    City,
    COUNT(CustomerID) AS TotalCustomers
FROM Customers
GROUP BY Country, City
ORDER BY TotalCustomers DESC;

