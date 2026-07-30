USE WindowFunctionsTrainingDB;
GO

SELECT
    Symbol,
    PriceDate,
    ClosePrice,
    LEAD(ClosePrice) OVER
    (
        PARTITION BY Symbol
        ORDER BY PriceDate
    ) AS NextClosePrice
FROM dbo.StockPrices
ORDER BY Symbol, PriceDate;
