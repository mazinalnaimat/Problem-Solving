USE RetailOperations3NFDB;
GO

/*
Challenge 40: Most Stable Product Demand
Difficulty: Hard

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.MD.
*/



;WITH MonthlyDemand AS
(
    select
          OI.ProductID,
          DATEFROMPARTS(YEAR(SO.OrderDate), MONTH(SO.OrderDate), 1) AS MonthStart,
          SUM(OI.Quantity) AS UnitsSold
    from OrderItems AS OI
    join SalesOrders AS SO
        on SO.OrderID = OI.OrderID
    where SO.OrderStatusID <> 6
    group by OI.ProductID,
             DATEFROMPARTS(YEAR(SO.OrderDate), MONTH(SO.OrderDate), 1)
),
DemandStats AS
(
    select
          Prc.CategoryID,
          MD.ProductID,
          COUNT(*) AS ActiveMonths,
          AVG(MD.UnitsSold * 1.0) AS AverageMonthlyUnits,
          STDEV(MD.UnitsSold * 1.0) AS MonthlyStdDev
    from MonthlyDemand AS MD
    join Products AS Prc 
        on Prc.ProductID = MD.ProductID
    group by Prc.CategoryID, MD.ProductID
    having COUNT(*) >= 6
),
Variability AS
(
    select
          DS.*,
          DS.MonthlyStdDev / NULLIF(DS.AverageMonthlyUnits,0) AS CoefficientOfVariation
    FROM DemandStats AS DS
),
RankedStability AS
(
    select
          Vrb.*,
          DENSE_RANK(
          ) OVER
          (
              partition by Vrb.CategoryID
              order by Vrb.CoefficientOfVariation, Vrb.ProductID
          ) AS StabilityRank
    from Variability AS Vrb
)
select
      Cg.CategoryName,
      Prc.SKU,
      RS.ActiveMonths,
      CAST(RS.AverageMonthlyUnits AS decimal(10,2)) AS AverageMonthlyUnits,
      CAST(RS.MonthlyStdDev AS decimal(10,2)) AS MonthlyStdDev,
      CAST(RS.CoefficientOfVariation AS decimal(9,4)) AS CoefficientOfVariation,
      RS.StabilityRank
from RankedStability AS RS
join Products As Prc 
    on Prc.ProductID = RS.ProductID
join Categories AS Cg
    on Cg.CategoryID = Prc.CategoryID
order by Cg.CategoryName, RS.StabilityRank, Prc.SKU;
