USE WindowFunctionsTrainingDB;
GO

SELECT
    Symbol,
    PriceDate,
    ClosePrice,
    FIRST_VALUE(ClosePrice) OVER
    (
        PARTITION BY Symbol
        ORDER BY PriceDate
    ) AS FirstClosePrice
FROM dbo.StockPrices
ORDER BY Symbol, PriceDate;
