-- Test Case ID: TC02
-- Title: Null Value Checks
-- Objective: Find NULL values in critical fields (QuantitySold, StoreID)

SELECT SalesID, ProductID, StoreID, QuantitySold, SalesDate, TotalAmount 
FROM SalesData 
WHERE QuantitySold IS NULL OR
StoreID IS NULL