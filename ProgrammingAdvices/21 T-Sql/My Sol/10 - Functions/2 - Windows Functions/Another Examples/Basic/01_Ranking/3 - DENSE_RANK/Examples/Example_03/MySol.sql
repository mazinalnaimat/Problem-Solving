USE WindowFunctionsTrainingDB;
GO


select 
      Symbol,
      PriceDate,
      ClosePrice,
      DENSE_RANk() OVER
      (
        partition by Symbol
        order by ClosePrice desc
      )

      AS DenseClosePriceRankDaily

from StockPrices;



