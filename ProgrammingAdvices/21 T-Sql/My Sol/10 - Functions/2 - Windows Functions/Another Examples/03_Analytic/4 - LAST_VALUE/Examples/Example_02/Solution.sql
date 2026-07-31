USE WindowFunctionsTrainingDB;
GO

SELECT
    Symbol,
    PriceDate,
    ClosePrice,
    LAST_VALUE(ClosePrice) OVER
    (
        PARTITION BY Symbol
        ORDER BY PriceDate
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS LastClosePrice
FROM dbo.StockPrices
ORDER BY Symbol, PriceDate;
