USE WindowFunctionsTrainingDB;
GO


select 
      Symbol,
      PriceDate,
      ClosePrice,
      SUM(ClosePrice) OVER
      (
        partition by Symbol
        order by PriceID, PriceDate
        rows between unbounded preceding and current row
      )
      AS TotalRunningClosePrice
from StockPrices;





