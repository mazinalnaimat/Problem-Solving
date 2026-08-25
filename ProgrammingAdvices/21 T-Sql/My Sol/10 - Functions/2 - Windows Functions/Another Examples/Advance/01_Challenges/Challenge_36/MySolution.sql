USE RetailOperations3NFDB;
GO

/*
Challenge 36: Order Lifecycle Bottleneck Stage
Difficulty: Hard

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/
/*
select * from SalesOrders;
select * from OrderStatuses;
select * from OrderStatusHistory;
*/
;WITH StatusTransitions AS
(
    select
          OSH.OrderID,
          OSH.OrderStatusID,
          OSH.ChangedAt AS StageStartedAt,
          LEAD(OSH.ChangedAt)
          OVER
          (
              partition by OSH.OrderID
              order by OSH.ChangedAt, OSH.OrderStatusHistoryID
          ) AS NextStatusAt
    from OrderStatusHistory AS OSH
),
StageDurations AS
(
    select
          ST.*,
          DATEDIFF(MINUTE, ST.StageStartedAt, ST.NextStatusAt) / 60.0 AS StageHours
    from StatusTransitions as ST
    where ST.NextStatusAt is not null
),
RankedStages AS
(
    SELECT
          SD.*,
          ROW_NUMBER()
          OVER
          (
              partition by SD.OrderID
              order by SD.StageHours DESC, SD.StageStartedAt
          ) AS BottleneckRank
    FROM StageDurations AS SD
)

select 
      SO.OrderNumber,
      OS.StatusName AS BottleneckStatus,
      RS.StageStartedAt,
      RS.NextStatusAt,
      CAST(RS.StageHours as decimal(10,2)) AS StageHours
from RankedStages AS RS
join SalesOrders AS SO
    on RS.OrderID = SO.OrderID
join OrderStatuses AS OS
    on RS.OrderStatusID = OS.OrderStatusID
where RS.BottleneckRank = 1
order by  RS.StageHours DESC, SO.OrderNumber  
