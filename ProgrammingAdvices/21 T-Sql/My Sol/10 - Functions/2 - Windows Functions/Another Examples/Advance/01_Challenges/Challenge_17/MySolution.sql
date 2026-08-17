/*
USE RetailOperations3NFDB;
GO
*/
/*
Challenge 17: Churn Warning from Median Purchase Gap
Difficulty: Hard

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/


with OrderSequence AS 
(
    select
          SO.CustomerID,
          SO.OrderID,
          SO.OrderDate,
          LAG(SO.OrderDate)
          OVER
          (
              partition by SO.CustomerID
              order by SO.OrderDate, SO.OrderId
          )AS PreOrderDate,
          COUNT(*)
          OVER
          (
              partition by SO.CustomerID
          ) AS OrderCount,
          MAX(SO.OrderDate)
          OVER
          (
              partition by SO.CustomerID
          ) AS LastOrderDate
    from SalesOrders AS SO
    where SO.OrderStatusID <> 6

),
OrderGaps AS
(
    select
        OS.*,
        (OS.PreOrderDate - OS.OrderDate)  AS GapDays

    from OrderSequence AS OS
    where OS.PreOrderDate is not null
),
CustomerMedianGaps as
(
    select 
          OG.CustomerID,
          PERCENTILE_CONT(0.5)
          WITHIN GROUP 
          (
            order by OG.GapDays
          )       AS MedianGapDays
    from OrderGaps AS OG
    group by OG.CustomerID
),
MedianGaps AS 
(
    select
         OG.*,
         CMG.MedianGapDays AS MedianGapDays
    from OrderGaps AS OG 
    join CustomerMedianGaps AS CMG
        on OG.CustomerID = CMG.CustomerID 
),
AnalysisDate AS
(
    select MAX(OrderDate) + INTERVAL '60 days' AS AsOfDate
    from SalesOrders
    WHERE OrderStatusID <> 6
)
select distinct
    Cu.CustomerNumber,
    MG.OrderCount,
    MG.LastOrderDate,
    CAST(MG.MedianGapDays AS decimal(9,2)) AS MedianGapDays,
    EXTRACT(DAY from (AD.AsOfDate - MG.LastOrderDate)) AS DaysSinceLastOrder,
    CAST(
        EXTRACT(DAY from (AD.AsOfDate - MG.LastOrderDate))
        / NULLIF(MG.MedianGapDays, 0)
        AS decimal(9,2)
    ) AS GapMultiple
from MedianGaps AS MG
cross join AnalysisDate AS AD
join Customers AS Cu 
    on Cu.CustomerID = MG.CustomerID
WHERE MG.OrderCount >= 3
  and EXTRACT(DAY from (MG.LastOrderDate - AD.AsOfDate)) > MG.MedianGapDays * 2
order  by GapMultiple DESC, Cu.CustomerNumber;




