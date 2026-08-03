USE WindowFunctionsTrainingDB;
GO

WITH x AS
(
    SELECT *,
           ROW_NUMBER() OVER
           (
               PARTITION BY CustomerName
               ORDER BY OrderDate DESC, OrderID DESC
           ) AS rn
    FROM dbo.SalesOrders
)
SELECT CustomerName, OrderID, OrderDate, Amount
FROM x
WHERE rn <= 2
ORDER BY CustomerName, rn;
