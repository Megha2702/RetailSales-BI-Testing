-- Test Case ID: TC03
-- Title: TotalAmount Accuracy Check
-- Objective: Validate that TotalAmount = QuantitySold * UnitPrice

SELECT s.SalesID, s.ProductID, s.QuantitySold, p.UnitPrice, s.TotalAmount,
(s.QuantitySold * p.UnitPrice) As ExpectedAmount
From SalesData s
JOIN Products p ON s.ProductID = p.ProductID
WHERE s.QuantitySold IS NOT NULL
AND s.TotalAmount != (s.QuantitySold * p.UnitPrice);