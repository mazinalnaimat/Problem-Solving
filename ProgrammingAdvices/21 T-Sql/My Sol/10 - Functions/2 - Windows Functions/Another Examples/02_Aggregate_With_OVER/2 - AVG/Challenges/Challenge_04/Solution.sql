USE WindowFunctionsTrainingDB;
GO

SELECT
    Symbol,
    PriceDate,
    ClosePrice,
    AVG(ClosePrice) OVER
    (
        PARTITION BY Symbol
        ORDER BY PriceDate
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Running_AVG_ClosePrice
FROM dbo.StockPrices
ORDER BY Symbol, PriceDate;
