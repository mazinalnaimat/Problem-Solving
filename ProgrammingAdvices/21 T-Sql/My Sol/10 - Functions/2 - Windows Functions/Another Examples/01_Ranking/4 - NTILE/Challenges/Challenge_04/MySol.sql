USE WindowFunctionsTrainingDB;
GO



SElect 
        Symbol,
        PriceDate,
        ClosePrice,
        NTILE(2) OVER
        (
            partition by Symbol
            order by closeprice desc
        )
        AS SymbolGroup

from StockPrices






