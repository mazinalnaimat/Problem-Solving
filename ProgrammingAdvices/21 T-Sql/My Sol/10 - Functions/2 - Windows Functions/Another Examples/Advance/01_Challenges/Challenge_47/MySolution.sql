USE RetailOperations3NFDB;
GO

/*
Challenge 47: Rolling 30-Day Revenue by Sales Channel
Difficulty: Hard

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/


WITH DateBounds AS
(
    select 
          MIN(OrderDate) AS MinDate,
          MAX(OrderDate) AS MaxDate
    from SalesOrders
),
Calendar AS
(
    select 
          MinDate AS CalendarDate,
          MaxDate
    from DateBounds

    UNION ALL

    select
          DATEADD(DAY,1,CalendarDate),
          MaxDate
    from Calendar
    where CalendarDate < MaxDate
),
OrderTotals as
(
    select 
          SO.OrderDate,
          SO.SalesChannelID,
          SUM
          (
            OI.Quantity * OI.UnitPrice * (1.0 - OI.DiscountPercent/100.0)
          )  - SO.OrderDiscount  AS OrderValue
    from SalesOrders AS SO
    join OrderItems AS OI
        on SO.OrderID = OI.OrderID
    where SO.OrderStatusID <> 6
    group by  SO.SalesChannelID, SO.OrderDate, SO.OrderDiscount

),
DailyRevenue AS
(
    select
          Cr.CalendarDate,
          SC.SalesChannelID,
          COALESCE(SUM(ot.OrderValue),0) AS DailyRevenue
    from Calendar AS  Cr
    cross join SalesChannels AS SC
    left join OrderTotals AS OT
      on OT.SalesChannelID = SC.SalesChannelID
     and OT.OrderDate = Cr.CalendarDate
    group by Cr.CalendarDate, SC.SalesChannelID
),
RollingRevenue AS
(
    SELECT
        DR.*,
        SUM(DR.DailyRevenue) 
        OVER
        (
            partition by DR.SalesChannelID
            order by DR.CalendarDate
            rows between 29 preceding and current row
        ) AS Rolling30DayRevenue
    from DailyRevenue AS DR
)
select
      RR.CalendarDate,
      SC.ChannelName,
      CAST(RR.DailyRevenue AS decimal(14,2)) AS DailyRevenue,
      CAST(RR.Rolling30DayRevenue AS decimal(14,2)) AS Rolling30DayRevenue
from RollingRevenue AS RR
join SalesChannels AS SC 
    on SC.SalesChannelID = RR.SalesChannelID
order by SC.ChannelName, RR.CalendarDate
OPTION (MAXRECURSION 0);







