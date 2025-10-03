--Add column UnitPrice to the products table
ALTER TABLE Products ADD UnitPrice Decimal(10,2);


-- Update UnitPrice values for each product
UPDATE Products
SET UnitPrice =
 CASE ProductID
	WHEN 1 THEN 1000.00			--Laptop
	WHEN 2 THEN 150.00			--Coffee Machine
	WHEN 3 THEN 700.00			--Smartphone
END;

