USE WindowFunctionsTrainingDB;
GO




select 
      Symbol,
      PriceDate,
      ClosePrice,
      LEAD(ClosePrice)
      OVER
      (
        partition by Symbol
        order by PriceDate
      )
      AS NextClosePrice
from StockPrices
order by Symbol, PriceDate;


