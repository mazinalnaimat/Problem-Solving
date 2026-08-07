USE RetailOperations3NFDB;
GO

;WITH OrderTicketCounts AS
(
    SELECT
        o.OrderID,
        o.OrderNumber,
        o.CustomerID,
        o.OrderDate,
        COUNT(st.TicketID) AS TicketsWithin14Days
    FROM dbo.SalesOrders o
    LEFT JOIN dbo.SupportTickets st
      ON st.CustomerID = o.CustomerID
     AND st.CreatedAt >= CAST(o.OrderDate AS datetime2(0))
     AND st.CreatedAt < DATEADD(DAY,15,CAST(o.OrderDate AS datetime2(0)))
    WHERE o.OrderStatusID <> 6
    GROUP BY o.OrderID, o.OrderNumber, o.CustomerID, o.OrderDate
),
TicketBaselines AS
(
    SELECT
        otc.*,
        AVG(otc.TicketsWithin14Days * 1.0) OVER
        (
            PARTITION BY otc.CustomerID
            ORDER BY otc.OrderDate, otc.OrderID
            ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING
        ) AS PreviousFiveAverage,
        COUNT(*) OVER
        (
            PARTITION BY otc.CustomerID
            ORDER BY otc.OrderDate, otc.OrderID
            ROWS BETWEEN 5 PRECEDING AND 1 PRECEDING
        ) AS BaselineOrderCount
    FROM OrderTicketCounts otc
)
SELECT
    c.CustomerNumber,
    tb.OrderNumber,
    tb.OrderDate,
    tb.TicketsWithin14Days,
    CAST(tb.PreviousFiveAverage AS decimal(9,2)) AS PreviousFiveAverage,
    CAST(tb.TicketsWithin14Days / NULLIF(tb.PreviousFiveAverage,0) AS decimal(9,2))
        AS SpikeMultiple
FROM TicketBaselines tb
JOIN dbo.Customers c ON c.CustomerID = tb.CustomerID
WHERE tb.BaselineOrderCount = 5
  AND tb.PreviousFiveAverage > 0
  AND tb.TicketsWithin14Days > tb.PreviousFiveAverage * 2
ORDER BY SpikeMultiple DESC, c.CustomerNumber, tb.OrderDate;
