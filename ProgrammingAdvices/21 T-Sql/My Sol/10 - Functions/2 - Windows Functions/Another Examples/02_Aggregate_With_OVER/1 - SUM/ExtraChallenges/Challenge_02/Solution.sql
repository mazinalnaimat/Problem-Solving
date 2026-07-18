/*
Challenge 02: Total sales for every region
Level: Beginner
*/

USE WindowFunctionsTrainingDB;
GO

SELECT
    Region,
    SUM(Amount) AS RegionTotal
FROM dbo.SalesOrders
GROUP BY Region
ORDER BY Region;

