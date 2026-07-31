USE WindowFunctionsTrainingDB;
GO

select  
      Symbol,
      PriceDate,
      ClosePrice,
      LAST_VALUE(ClosePrice)
      OVER
      (
        partition by Symbol
        order by PriceDate
        rows between 
        unbounded preceding and unbounded following
      )AS LastClosePricePerSymbol
from StockPrices
order by Symbol, PriceDate;
