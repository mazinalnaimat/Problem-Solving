USE WindowFunctionsTrainingDB;
GO

SELECT
    Symbol,
    PriceDate,
    ClosePrice,
    NTILE(2) OVER (PARTITION BY Symbol ORDER BY ClosePrice DESC) AS PriceHalf
FROM dbo.StockPrices
ORDER BY Symbol, PriceHalf, ClosePrice DESC;
