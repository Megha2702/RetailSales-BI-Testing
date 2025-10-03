-- Insert Products
INSERT INTO Products (ProductID, ProductName, Category) VALUES
(1, 'Laptop', 'Electronics'),
(2, 'Coffee Machine', 'Appliances'),
(3, 'Smartphone', 'Electronics');

-- Insert Stores
INSERT INTO Stores (StoreID, StoreName, Region) VALUES
(1, 'Downtown Store', 'North'),
(2, 'Suburb Store', 'South'),
(3, 'Mall Outlet', 'West');

-- Insert SalesData
INSERT INTO SalesData (ProductID, StoreID, SalesDate, QuantitySold, TotalAmount) VALUES
(1, 1, '2023-01-01', 5, 5000),
(2, 2, '2023-01-02', 3, 450),
(3, 3, '2023-01-03', 10, 7000),
(2, 1, '2023-02-01', NULL, 300),        -- QuantitySold NULL for validation
(1, NULL, '2023-03-05', 2, 2000),       -- StoreID NULL for validation
(1, 2, '2026-01-01', 2, 2000);          -- Future-dated sale for validation
