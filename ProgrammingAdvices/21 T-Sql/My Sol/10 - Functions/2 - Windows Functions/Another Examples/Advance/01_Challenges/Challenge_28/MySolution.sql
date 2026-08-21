USE RetailOperations3NFDB;
GO

/*
Challenge 28: RFM Customer Scoring
Difficulty: Hard

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/

Declare @MaxOrderDatePlusOneDay as date;

SET @MaxOrderDatePlusOneDay =
                    (
                        Select DATEADD(DAY, 1, MAX(SO.OrderDate))
                        from SalesOrders AS SO
                    );
with OrderTotals AS 
(
    select
          SO.OrderID,
          SO.CustomerID,
          SO.OrderDate,
          SUM(OI.Quantity * OI.UnitPrice * (1 - OI.DiscountPercent / 100.0))
              - SO.OrderDiscount AS OrderValue
    from SalesOrders AS SO
    join OrderItems AS OI 
        on OI.OrderID = SO.OrderID
    where SO.OrderStatusID <> 6
    group by SO.OrderID, SO.CustomerID, SO.OrderDate, SO.OrderDiscount
),
CustomerMetrics AS
(
    select
          OT.CustomerID,
          DATEDIFF(DAY, MAX(OT.OrderDate), @MaxOrderDatePlusOneDay) AS DaysSinceLastOrder,
          COUNT(*) AS OrderCount,
          SUM(OT.OrderValue) AS LifetimeValue
    from OrderTotals AS OT
    group by OT.CustomerID
),
Scores AS
(
    select
        cm.*,
        NTILE(5)
        OVER 
        (
            ORDER BY cm.DaysSinceLastOrder DESC
        ) AS RecencyScore,
        NTILE(5)
        OVER 
        (
            ORDER BY cm.OrderCount
        ) AS FrequencyScore,
        NTILE(5)
        OVER 
        (
            ORDER BY cm.LifetimeValue
        ) AS MonetaryScore
    from CustomerMetrics cm
)

select 
      Cu.CustomerNumber,
      Scr.DaysSinceLastOrder,
      Scr.OrderCount,
      CAST(Scr.LifetimeValue AS decimal(14,2)) AS LifetimeValue,
      Scr.RecencyScore,
      Scr.FrequencyScore,
      Scr.MonetaryScore,
      CONCAT(Scr.RecencyScore, Scr.FrequencyScore, Scr.MonetaryScore)
      AS RFMCode
from Scores AS Scr
join Customers AS Cu
    on Scr.CustomerID = Cu.CustomerID
order by RFMCode DESC, Scr.LifetimeValue DESC, Cu.CustomerNumber;
