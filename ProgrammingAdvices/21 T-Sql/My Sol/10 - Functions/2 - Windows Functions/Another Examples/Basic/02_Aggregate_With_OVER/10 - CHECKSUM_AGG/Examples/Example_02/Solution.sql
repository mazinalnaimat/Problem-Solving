USE WindowFunctionsTrainingDB;
GO

SELECT
    Region,
    OrderID,
    CustomerName,
    Amount,
    CHECKSUM_AGG(OrderID) OVER
    (
        PARTITION BY Region
    ) AS OrderChecksumInRegion
FROM dbo.SalesOrders
ORDER BY Region, OrderID;
