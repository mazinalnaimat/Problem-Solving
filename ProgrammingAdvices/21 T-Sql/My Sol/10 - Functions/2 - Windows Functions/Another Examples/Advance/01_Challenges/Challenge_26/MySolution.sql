/*
USE RetailOperations3NFDB;
GO
*/
/*
Challenge 26: Seven-Day Channel Revenue Spike
Difficulty: Hard

Write your solution below.
Requirements:
- Use at least one CTE.
- Use at least one window function.
- Return the exact columns and ordering from Challenge.md.
*/
/*
select * from SalesOrders;
select * from SalesChannels;
select * from OrderItems;
*/
with recursive DateBounds AS 
(
    select 
        MIN(SO.OrderDate) AS MinOrderDate,
        MAX(SO.OrderDate) AS MaxOrderDate
    from SalesOrders AS SO
),
Calendar AS 
(
    select 
         MinOrderDate AS CalendarDate,
         MaxOrderDate
    from DateBounds

    UNION ALL

    select
          CalendarDate +1,
          MaxOrderDate 
    from Calendar
    where Calendar.CalendarDate < Calendar.MaxOrderDate
),
OrderTotals AS
(
    select
          SO.OrderID,
          SO.SalesChannelID,
          SO.OrderDate,
          SUM(
              OI.Quantity
              * OI.UnitPrice
              * (1 - OI.DiscountPercent / 100.0)
          ) - SO.OrderDiscount AS OrderValue
    from SalesOrders AS SO
    join OrderItems AS OI
        on OI.OrderID = SO.OrderID
    where SO.OrderStatusID <> 6
    group by
        SO.OrderID,
        SO.SalesChannelID,
        SO.OrderDate,
        SO.OrderDiscount
),
DailyRevenue AS
(
    select
        c.CalendarDate,
        sc.SalesChannelID,
        COALESCE(SUM(ot.OrderValue), 0) AS DailyRevenue
    from Calendar c
    CROSS join SalesChannels sc
    LEFT join OrderTotals ot
        on ot.OrderDate = c.CalendarDate
       and ot.SalesChannelID = sc.SalesChannelID
    group by
        c.CalendarDate,
        sc.SalesChannelID
),
RollingSeven AS
(
    select
        DR.*,
        SUM(DR.DailyRevenue) OVER
        (
            PARTITION BY DR.SalesChannelID
            order by DR.CalendarDate
            rows between 6 preceding and CURRENT ROW
        ) AS Rolling7DayRevenue
    from DailyRevenue AS DR
),
SpikeBaseline AS
(
    select
        rs.*,
        AVG(rs.Rolling7DayRevenue) OVER
        (
            PARTITION BY rs.SalesChannelID
            order by rs.CalendarDate
            rows between 4 preceding and 1 preceding
        ) AS PreviousFourRollingAverage,

        COUNT(*) OVER
        (
            PARTITION BY rs.SalesChannelID
            order by rs.CalendarDate
            rows between 4 preceding and 1 preceding
        ) AS BaselineCount

    from RollingSeven rs
)
select
    sb.CalendarDate,
    sc.ChannelName,

    CAST(
        sb.Rolling7DayRevenue AS decimal(14,2)
    ) AS Rolling7DayRevenue,

    CAST(
        sb.PreviousFourRollingAverage AS decimal(14,2)
    ) AS PreviousFourRollingAverage,

    CAST(
        (
            sb.Rolling7DayRevenue
            / NULLIF(sb.PreviousFourRollingAverage, 0)
            - 1
        ) * 100
        AS decimal(9,2)
    ) AS SpikePercent

from SpikeBaseline sb
join SalesChannels sc
    on sc.SalesChannelID = sb.SalesChannelID

where sb.BaselineCount = 4
  and sb.Rolling7DayRevenue > sb.PreviousFourRollingAverage * 1.50

order by
    SpikePercent DESC,
    sc.ChannelName,
    sb.CalendarDate;
