/*
USE RetailOperations3NFDB;
GO
*/

/*
Challenge 25: Three-Month Cancellation Rate Trend
Difficulty: Medium

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/

/*
select * from SalesOrders;
select * from SalesChannels;
*/

with OrderCountsPerChannel as
(
    select 
          SO.SalesChannelID,
          MAKE_DATE(EXTRACT (YEAR from SO.OrderDate)::int, EXTRACT (MONTH from SO.OrderDate)::int, 1) AS MonthStart,
          COUNT(*) AS OrderCount,
          SUM
          (
            CASE 
                WHEN SO.OrderStatusID <> 6 THEN 0
                ELSE 1
            END
          )
          AS CancelledCount
    from SalesOrders AS SO
    group by SO.SalesChannelID, MAKE_DATE(EXTRACT (YEAR from SO.OrderDate)::int, EXTRACT (MONTH from SO.OrderDate)::int, 1)
)

select  
      SC.ChannelName,
      OCPC.MonthStart,
      OCPC.OrderCount AS OrderCount,
      OCPC.CancelledCount AS CancelledCount,
      CAST( OCPC.CancelledCount * 100.0 / NULLIF(OCPC.OrderCount, 0) as decimal(10, 2)) AS CancellationRate,
      CAST
      (
        AVG
        (
          CAST( OCPC.CancelledCount * 100.0 / NULLIF(OCPC.OrderCount,0) as decimal(10, 2)) 
        )
        OVER
        (
          partition by OCPC.SalesChannelID
          order by OCPC.MonthStart
          rows between 
          2 preceding and current row
        )  
      as decimal (10,2))AS ThreeMonthAvgRate
from OrderCountsPerChannel AS OCPC
join SalesChannels AS SC
    on OCPC.SalesChannelID = SC.SalesChannelID
order by SC.ChannelName, OCPC.MonthStart;



