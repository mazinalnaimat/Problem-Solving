USE WindowFunctionsTrainingDB;
GO

SELECT
    Symbol,
    PriceDate,
    ClosePrice,
    DENSE_RANK() OVER (PARTITION BY Symbol ORDER BY ClosePrice DESC) AS DensePriceRank
FROM dbo.StockPrices
ORDER BY Symbol, DensePriceRank;
