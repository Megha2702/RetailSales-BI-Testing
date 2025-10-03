-- Test Case ID: TC06
-- Title: Monthly Sales Summary per Store
-- Objective: Aggregate total sales quantity and amount by Store and Month

SELECT 
    StoreID,
    DATEPART(YEAR, SalesDate) AS SalesYear,
    DATEPART(MONTH, SalesDate) AS SalesMonth,
    SUM(QuantitySold) AS TotalQuantitySold,
    SUM(TotalAmount) AS TotalSalesAmount
FROM SalesData
GROUP BY StoreID, DATEPART(YEAR, SalesDate), DATEPART(MONTH, SalesDate)
ORDER BY StoreID, SalesYear, SalesMonth;
