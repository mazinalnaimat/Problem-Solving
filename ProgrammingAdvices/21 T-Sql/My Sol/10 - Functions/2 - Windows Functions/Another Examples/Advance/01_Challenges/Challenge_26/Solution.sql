WITH RECURSIVE DateBounds AS
(
    SELECT
        MIN(OrderDate) AS MinDate,
        MAX(OrderDate) AS MaxDate
    FROM SalesOrders
),
Calendar AS
(
    SELECT
        MinDate AS CalendarDate,
        MaxDate
    FROM DateBounds

    UNION ALL

    SELECT
        CalendarDate + 1,
        MaxDate
    FROM Calendar
    WHERE CalendarDate < MaxDate
),
OrderTotals AS
(
    SELECT
        o.OrderID,
        o.SalesChannelID,
        o.OrderDate,
        SUM(
            oi.Quantity
            * oi.UnitPrice
            * (1 - oi.DiscountPercent / 100.0)
        ) - o.OrderDiscount AS OrderValue
    FROM SalesOrders o
    JOIN OrderItems oi
        ON oi.OrderID = o.OrderID
    WHERE o.OrderStatusID <> 6
    GROUP BY
        o.OrderID,
        o.SalesChannelID,
        o.OrderDate,
        o.OrderDiscount
),
DailyRevenue AS
(
    SELECT
        c.CalendarDate,
        sc.SalesChannelID,
        COALESCE(SUM(ot.OrderValue), 0) AS DailyRevenue
    FROM Calendar c
    CROSS JOIN SalesChannels sc
    LEFT JOIN OrderTotals ot
        ON ot.OrderDate = c.CalendarDate
       AND ot.SalesChannelID = sc.SalesChannelID
    GROUP BY
        c.CalendarDate,
        sc.SalesChannelID
),
RollingSeven AS
(
    SELECT
        dr.*,
        SUM(dr.DailyRevenue) OVER
        (
            PARTITION BY dr.SalesChannelID
            ORDER BY dr.CalendarDate
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS Rolling7DayRevenue
    FROM DailyRevenue dr
),
SpikeBaseline AS
(
    SELECT
        rs.*,

        AVG(rs.Rolling7DayRevenue) OVER
        (
            PARTITION BY rs.SalesChannelID
            ORDER BY rs.CalendarDate
            ROWS BETWEEN 4 PRECEDING AND 1 PRECEDING
        ) AS PreviousFourRollingAverage,

        COUNT(*) OVER
        (
            PARTITION BY rs.SalesChannelID
            ORDER BY rs.CalendarDate
            ROWS BETWEEN 4 PRECEDING AND 1 PRECEDING
        ) AS BaselineCount

    FROM RollingSeven rs
)
SELECT
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

FROM SpikeBaseline sb
JOIN SalesChannels sc
    ON sc.SalesChannelID = sb.SalesChannelID

WHERE sb.BaselineCount = 4
  AND sb.Rolling7DayRevenue > sb.PreviousFourRollingAverage * 1.50

ORDER BY
    SpikePercent DESC,
    sc.ChannelName,
    sb.CalendarDate;