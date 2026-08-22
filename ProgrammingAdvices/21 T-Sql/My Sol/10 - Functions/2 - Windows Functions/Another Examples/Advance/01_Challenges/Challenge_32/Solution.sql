USE RetailOperations3NFDB;
GO

;WITH OrderTotals AS
(
    SELECT
        o.OrderID,
        o.CustomerID,
        o.OrderDate,
        DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1) AS MonthStart,
        SUM(oi.Quantity * oi.UnitPrice * (1 - oi.DiscountPercent / 100.0))
            - o.OrderDiscount AS OrderValue
    FROM dbo.SalesOrders o
    JOIN dbo.OrderItems oi ON oi.OrderID = o.OrderID
    WHERE o.OrderStatusID <> 6
    GROUP BY o.OrderID, o.CustomerID, o.OrderDate, o.OrderDiscount
),
SequencedOrders AS
(
    SELECT
        ot.*,
        ROW_NUMBER() OVER
        (
            PARTITION BY ot.CustomerID
            ORDER BY ot.OrderDate, ot.OrderID
        ) AS CustomerOrderSequence
    FROM OrderTotals ot
),
MonthlyMix AS
(
    SELECT
        so.MonthStart,
        CASE WHEN so.CustomerOrderSequence = 1 THEN 'New' ELSE 'Returning' END
            AS CustomerType,
        COUNT(*) AS OrderCount,
        SUM(so.OrderValue) AS Revenue
    FROM SequencedOrders so
    GROUP BY so.MonthStart,
             CASE WHEN so.CustomerOrderSequence = 1 THEN 'New' ELSE 'Returning' END
),
WithMonthlyTotal AS
(
    SELECT
        mm.*,
        SUM(mm.Revenue) OVER
        (
            PARTITION BY mm.MonthStart
        ) AS MonthRevenue
    FROM MonthlyMix mm
)
SELECT
    MonthStart,
    CustomerType,
    OrderCount,
    CAST(Revenue AS decimal(14,2)) AS Revenue,
    CAST(Revenue * 100.0 / NULLIF(MonthRevenue,0) AS decimal(7,2))
        AS RevenueSharePercent
FROM WithMonthlyTotal
ORDER BY MonthStart, CustomerType;
