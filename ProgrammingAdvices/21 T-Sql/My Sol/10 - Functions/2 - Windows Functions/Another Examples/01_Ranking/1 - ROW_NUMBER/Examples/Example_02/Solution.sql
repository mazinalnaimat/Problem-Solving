USE WindowFunctionsTrainingDB;
GO

WITH NumberedOrders AS
(
    SELECT
        OrderID,
        CustomerName,
        OrderDate,
        Amount,
        ROW_NUMBER() OVER
        (
            PARTITION BY CustomerName
            ORDER BY OrderDate DESC, OrderID DESC
        ) AS rn
    FROM dbo.SalesOrders
)
SELECT *
FROM NumberedOrders
WHERE rn = 1
ORDER BY CustomerName;
