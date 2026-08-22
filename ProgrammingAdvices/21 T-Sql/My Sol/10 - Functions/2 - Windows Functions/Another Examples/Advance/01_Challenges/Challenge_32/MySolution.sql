USE RetailOperations3NFDB;
GO

/*
Challenge 32: New versus Returning Customer Revenue Mix
Difficulty: Hard

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/

;WITH OrderTotals AS
(
    SELECT
          SO.OrderID,
          SO.CustomerID,
          SO.OrderDate,
          DATEFROMPARTS(YEAR(SO.OrderDate), MONTH(SO.OrderDate), 1) AS MonthStart,
          SUM(OI.Quantity * OI.UnitPrice * (1 - OI.DiscountPercent / 100.0))
              - SO.OrderDiscount AS OrderValue
    from SalesOrders AS SO
    join OrderItems AS OI
         on SO.OrderID = OI.OrderID
    where SO.OrderStatusID <> 6
    group by SO.OrderID, SO.CustomerID, SO.OrderDate, SO.OrderDiscount
),
SequencedOrders AS
(
    select
          OT.*,
          ROW_NUMBER() OVER
          (
              partition by OT.CustomerID
              order by OT.OrderDate, OT.OrderID
          ) AS CustomerOrderSequence
    from OrderTotals AS OT
),
MonthlyMix AS 
(
    select 
          SqOr.MonthStart,
          CASE
            WHEN  SqOr.CustomerOrderSequence =1 
                THEN 'New'
            ELSE
                'Returning'
          END AS CustomerType,
          COUNT(*) AS OrderCount,
          SUM(SqOr.OrderValue) AS Revenue
     from SequencedOrders AS SqOr
     group by  SqOr.MonthStart,
             CASE WHEN SqOr.CustomerOrderSequence = 1 THEN 'New' ELSE 'Returning' END
),
WithMonthlyTotal AS
(
    select
          MM.*,
          SUM(MM.Revenue)
          OVER
          (
              partition by MM.MonthStart
          ) AS MonthRevenue
    from MonthlyMix MM
)
select
      MonthStart,
      CustomerType,
      OrderCount,
      CAST(Revenue AS decimal(14,2)) AS Revenue,
      CAST(Revenue * 100.0 / NULLIF(MonthRevenue,0) AS decimal(7,2))
          AS RevenueSharePercent
from WithMonthlyTotal
order by MonthStart, CustomerType;

