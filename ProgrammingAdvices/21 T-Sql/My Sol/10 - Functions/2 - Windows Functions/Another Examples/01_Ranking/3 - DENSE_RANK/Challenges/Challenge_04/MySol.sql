USE WindowFunctionsTrainingDB;
GO


select 
      Symbol,
      PriceDate,
      ClosePrice,
      DENSE_RANK() OVER
      (
        partition by symbol
        order by ClosePrice desc
      )
      AS DenseClosePriceRank

from StockPrices;
