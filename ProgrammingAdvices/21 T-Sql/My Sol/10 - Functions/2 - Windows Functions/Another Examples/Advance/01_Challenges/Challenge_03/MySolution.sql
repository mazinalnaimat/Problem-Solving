USE RetailOperations3NFDB;
GO

/*
Challenge 03: Post-Order Support Spike
Difficulty: Hard

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/



;with OrderTicketCounts AS
(
    select 
          SO.OrderID,
          SO.OrderNumber,
          SO.CustomerID,
          SO.OrderDate,
          count(ST.TicketID) AS TicketNumWithin14Days
    from SalesOrders AS SO 
    left join SupportTickets AS ST
        on ST.OrderID = SO.OrderID 
        and ST.CreatedAt >= CAST(SO.OrderDate AS datetime2(0))
        and st.CreatedAt < DATEADD(DAY,15,CAST(SO.OrderDate AS datetime2(0)))
    WHERE SO.OrderStatusID <> 6
    group by  SO.OrderID, SO.OrderNumber, SO.CustomerID, SO.OrderDate
),
TicketBaselines AS
(
    select
        OTC.*,
        AVG(OTC.TicketNumWithin14Days * 1.0) 
        OVER
        (
            partition by  OTC.CustomerID
            order by OTC.OrderDate, OTC.OrderID
            rows BETWEEN 5 preceding AND 1 preceding
        ) AS PreviousFiveAverage,
        COUNT(*) 
        OVER
        (
            partition by  OTC.CustomerID
            order by OTC.OrderDate, OTC.OrderID
            rows BETWEEN 5 preceding AND 1 preceding
        ) AS BaselineOrderCount
    from OrderTicketCounts as OTC
)
select
    Cu.CustomerNumber,
    TB.OrderNumber,
    TB.OrderDate,
    TB.TicketNumWithin14Days,
    CAST(TB.PreviousFiveAverage AS decimal(9,2)) AS PreviousFiveAverage,
    CAST(TB.TicketNumWithin14Days / NULLIF(TB.PreviousFiveAverage,0) AS decimal(9,2))
        AS SpikeMultiple
from TicketBaselines tb
join Customers Cu ON Cu.CustomerID = TB.CustomerID
where TB.BaselineOrderCount = 5
  and TB.PreviousFiveAverage > 0
  and TB.TicketNumWithin14Days > TB.PreviousFiveAverage * 2
order by SpikeMultiple DESC, Cu.CustomerNumber, TB.OrderDate;

