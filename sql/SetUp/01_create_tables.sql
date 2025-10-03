CREATE DATABASE RetailSalesDB
GO
USE RetailSalesDB

-- Table: Products

CREATE TABLE Products(ProductID INT PRIMARY KEY,
ProductName NVARCHAR(100),
Category NVARCHAR(50));

-- Table: Stores

CREATE TABLE Stores(StoreID INT PRIMARY KEY,
StoreName NVARCHAR(100),
Region NVARCHAR(50));

-- Table: SalesData
CREATE TABLE SalesData( SalesID INT IDENTITY(1,1) PRIMARY KEY,
ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
StoreID INT FOREIGN KEY REFERENCES Stores(StoreID),
SalesDate DATE,
QuantitySold INT,
TotalAmount DECIMAL(10,2));

