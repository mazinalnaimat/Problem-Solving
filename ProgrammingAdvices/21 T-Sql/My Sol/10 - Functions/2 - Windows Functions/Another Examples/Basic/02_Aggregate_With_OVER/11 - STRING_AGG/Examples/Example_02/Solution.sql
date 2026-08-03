USE WindowFunctionsTrainingDB;
GO

SELECT
    Region,
    STRING_AGG(ProductCategory, ', ') WITHIN GROUP (ORDER BY ProductCategory) AS Categories
FROM
(
    SELECT DISTINCT Region, ProductCategory
    FROM dbo.SalesOrders
) x
GROUP BY Region
ORDER BY Region;
