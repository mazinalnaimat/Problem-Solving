USE WindowFunctionsTrainingDB;
GO

select
      Symbol,
      PriceDate,
      ClosePrice,
	  FIRST_VALUE(ClosePrice)
	  OVER
	  (
		partition by Symbol 
		order by PriceDate
	  )AS FirstClosePricePerSymbol
from StockPrices
order by Symbol, PriceDate;
