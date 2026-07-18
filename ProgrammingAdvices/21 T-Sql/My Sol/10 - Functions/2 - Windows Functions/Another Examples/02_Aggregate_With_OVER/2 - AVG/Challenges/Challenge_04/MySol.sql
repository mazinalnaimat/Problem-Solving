USE WindowFunctionsTrainingDB;
GO


select 
       Symbol,
       PriceDate,
       ClosePrice,
       AVG(ClosePrice)
       OVER
       (
          partition by Symbol
          ORDER BY PriceDate
           ROWS BETWEEN
           UNBOUNDED PRECEDING AND CURRENT ROW
 
       )
       AS AvgPriceInStock

from StockPrices





















