USE RetailOperations3NFDB;
GO

declare @MaxOrderDate date;

select 
      @MaxOrderDate = MAX(SO.OrderDate)
from SalesOrders AS SO;

WITH YearlyQuarters AS
(
    select
          YEAR(MIN(SO.OrderDate)) AS [Year],
          DATEFROMPARTS(YEAR(MIN(SO.OrderDate)), 1, 1) AS QuarterStart,
          1 AS QuarterNumber
    from SalesOrders AS SO

    UNION ALL

    select
        CASE
            WHEN YQ.QuarterNumber = 4
                THEN YQ.[Year] + 1
            ELSE YQ.[Year]
        END AS [Year],
        DATEADD(MONTH, 3, YQ.QuarterStart) AS QuarterStart,
        CASE
            WHEN YQ.QuarterNumber = 4
                THEN 1
            ELSE YQ.QuarterNumber + 1
        END AS QuarterNumber
    from YearlyQuarters AS YQ
    where DATEADD(MONTH, 3, YQ.QuarterStart) <= @MaxOrderDate
),

OrderCategoryRevenue AS
(
    select
        SO.OrderID,
        YEAR(SO.OrderDate) AS OrderYear,
        YQ.QuarterNumber AS OrderQuarterNum,
        Prc.CategoryID,
        SUM(
            OI.Quantity
            * OI.UnitPrice
            * (1.0 - OI.DiscountPercent / 100.0)
        ) AS CategoryGrossRevenue,
        SO.OrderDiscount
    from SalesOrders AS SO
    join OrderItems AS OI
        on OI.OrderID = SO.OrderID
    join Products AS Prc
        on OI.ProductID = Prc.ProductID
    join YearlyQuarters AS YQ
        on SO.OrderDate >= YQ.QuarterStart
        AND SO.OrderDate < DATEADD(MONTH, 3, YQ.QuarterStart)
    where SO.OrderStatusID <> 6

    group by
        SO.OrderID,
        YEAR(SO.OrderDate),
        YQ.QuarterNumber,
        Prc.CategoryID,
        SO.OrderDiscount
),

OrderTotals AS
(
    select
          OrderID,
          SUM(CategoryGrossRevenue) AS OrderGrossRevenue
    from OrderCategoryRevenue
    group by
        OrderID
),

CategoryRevenuePerYearlyQuarter AS
(
    select
          OCR.CategoryID,
          OCR.OrderYear,
          OCR.OrderQuarterNum,          
          SUM(
              OCR.CategoryGrossRevenue
              -
              CASE
                  WHEN OT.OrderGrossRevenue = 0 THEN 0
                  ELSE
                      OCR.OrderDiscount
                      * OCR.CategoryGrossRevenue
                      / OT.OrderGrossRevenue
              END
          ) AS CategoryRevenue
    from OrderCategoryRevenue AS OCR
    join OrderTotals AS OT
        on OCR.OrderID = OT.OrderID
    group by
        OCR.CategoryID,
        OCR.OrderYear,
        OCR.OrderQuarterNum
)

select
      CRPYQ.OrderYear AS SalesYear,
      CRPYQ.OrderQuarterNum AS SalesQuarter,
      Cg.CategoryName,
      
      CAST(
          CRPYQ.CategoryRevenue
          AS decimal(12,2)
      ) AS QuarterRevenue,
      
      RANK() OVER
      (
          partition by
              CRPYQ.OrderYear,
              CRPYQ.OrderQuarterNum
      
          order by
              CRPYQ.CategoryRevenue DESC
      ) AS CategoryRank
from CategoryRevenuePerYearlyQuarter AS CRPYQ
join Categories AS Cg
    on CRPYQ.CategoryID = Cg.CategoryID
order by
    SalesYear,
    SalesQuarter,
    CategoryRank,
    CategoryName

OPTION (MAXRECURSION 0);
