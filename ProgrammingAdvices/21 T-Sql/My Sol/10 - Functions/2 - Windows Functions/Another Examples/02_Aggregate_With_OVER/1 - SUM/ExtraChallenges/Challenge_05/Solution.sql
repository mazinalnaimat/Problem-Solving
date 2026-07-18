/*
Challenge 05: Total by region and product category
Level: Intermediate
*/

USE WindowFunctionsTrainingDB;
GO

SELECT
    OrderID,
    Region,
    ProductCategory,
    OrderDate,
    Amount,
    SUM(Amount) OVER
    (
        PARTITION BY Region, ProductCategory
    ) AS RegionCategoryTotal
FROM dbo.SalesOrders
ORDER BY Region, ProductCategory, OrderDate, OrderID;

