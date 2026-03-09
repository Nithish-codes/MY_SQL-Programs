CREATE DATABASE IF NOT EXISTS db8;
USE db8;

-- Creating a sample table
DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    Stock INT
);

-- Inserting sample records
INSERT INTO Products VALUES 
(1, 'Laptop', 55000.00, 30),
(2, 'Mouse', 400.00, 150),
(3, 'Keyboard', 1200.00, 100),
(4, 'Monitor', 15000.00, 25);

-- Viewing all products
SELECT * FROM Products;

-- Creating a view for products with a price above 1000
DROP VIEW IF EXISTS Expensive_Products;
CREATE VIEW Expensive_Products AS
SELECT ProductID, ProductName, Price
FROM Products
WHERE Price > 1000;

-- Selecting from the view
SELECT * FROM Expensive_Products;

-- Disable safe update mode for this session
SET SQL_SAFE_UPDATES = 0;

-- Updating the base table via view
UPDATE Expensive_Products 
SET Price = 1700.00 
WHERE ProductName = 'Keyboard';

-- Re-enable safe update mode (best practice)
SET SQL_SAFE_UPDATES = 1;

-- Checking updated data
SELECT * FROM Products;

-- Creating an index on Price
CREATE INDEX idx_price ON Products(Price);

-- Showing indexed column (will differ by DBMS)
SHOW INDEX FROM Products;

-- Dropping the view
DROP VIEW Expensive_Products;
DROP INDEX idx_price ON Products;
DROP TABLE Products;