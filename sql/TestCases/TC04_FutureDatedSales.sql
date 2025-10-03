-- Test Case ID: TC04
-- Title: Future Dated Sales Check
-- Objective: Detect sales records with a SalesDate in the future

SELECT SalesID, ProductID, StoreID, SalesDate
FROM SalesData
Where SalesDate > CAST(GETDATE() As DATE);