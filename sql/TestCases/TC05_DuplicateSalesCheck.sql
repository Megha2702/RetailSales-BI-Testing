-- Test Case ID: TC05
-- Title: Duplicate Sales Check
-- Objective: Find duplicate sales with same ProductID, StoreID, SalesDate, QuantitySold

SELECT ProductID, StoreID, SalesDate, QuantitySold, COUNT(*) AS DuplicateCount
FROM SalesData
GROUP BY ProductID, StoreID, SalesDate, QuantitySold 
HAVING COUNT(*) > 1;