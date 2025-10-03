-- Test Case ID: TC01
-- Title: Referential Integrity Check
-- Objective: Ensure all the ProductID and StoreID in the SalesData exist in the Products and Stores.

-- Check for the invalid ProductIDs
SELECT DISTINCT s.ProductID 
FROM SalesData s
LEFT JOIN Products p ON s.ProductID = p.ProductID
WHERE s.ProductID IS NOT NULL AND p.ProductID IS NULL;


-- Check for invalid StoreIDs
SELECT DISTINCT s.StoreID
FROM SalesData s
LEFT JOIN Stores st ON s.StoreID = st.StoreID
WHERE s.StoreID IS NOT NULL AND st.StoreID IS NULL;