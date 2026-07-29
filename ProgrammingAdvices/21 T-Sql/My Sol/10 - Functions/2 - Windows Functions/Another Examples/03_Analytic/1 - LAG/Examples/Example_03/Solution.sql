USE WindowFunctionsTrainingDB;
GO

SELECT
    Symbol,
    PriceDate,
    ClosePrice,
    LAG(ClosePrice) OVER
    (
        PARTITION BY Symbol
        ORDER BY PriceDate
    ) AS PreviousClosePrice
FROM dbo.StockPrices
ORDER BY Symbol, PriceDate;
