/*USE RetailOperations3NFDB;
GO*/

;WITH OrderTotals AS
(
    SELECT
        o.OrderID,
        o.CustomerID,
        SUM(oi.Quantity * oi.UnitPrice * (1 - oi.DiscountPercent / 100.0))
            - o.OrderDiscount AS OrderValue
    FROM dbo.SalesOrders o
    JOIN dbo.OrderItems oi ON oi.OrderID = o.OrderID
    WHERE o.OrderStatusID <> 6
    GROUP BY o.OrderID, o.CustomerID, o.OrderDiscount
),
CustomerAverages AS
(
    SELECT
        c.CustomerID,
        c.SegmentID,
        AVG(ot.OrderValue) AS AverageOrderValue
    FROM dbo.Customers c
    JOIN OrderTotals ot ON ot.CustomerID = c.CustomerID
    GROUP BY c.CustomerID, c.SegmentID
),
SegmentMedians AS
(
    SELECT
        SegmentID,
        PERCENTILE_CONT(0.50)
            WITHIN GROUP (ORDER BY AverageOrderValue) AS SegmentMedianAOV
    FROM CustomerAverages
    GROUP BY SegmentID
),
SegmentComparison AS
(
    SELECT
        ca.*,
        sm.SegmentMedianAOV,
        PERCENT_RANK() OVER
        (
            PARTITION BY ca.SegmentID
            ORDER BY ca.AverageOrderValue
        ) AS SegmentPercentRank
    FROM CustomerAverages ca
    JOIN SegmentMedians sm
        ON sm.SegmentID = ca.SegmentID
)
SELECT
    cs.SegmentName,
    c.CustomerNumber,
    CAST(sc.AverageOrderValue AS decimal(14,2)) AS AverageOrderValue,
    CAST(sc.SegmentMedianAOV AS decimal(14,2)) AS SegmentMedianAOV,
    CAST(sc.AverageOrderValue - sc.SegmentMedianAOV AS decimal(14,2))
        AS AmountAboveMedian,
    CAST(sc.SegmentPercentRank AS decimal(7,4)) AS SegmentPercentRank
FROM SegmentComparison sc
JOIN dbo.Customers c ON c.CustomerID = sc.CustomerID
JOIN dbo.CustomerSegments cs ON cs.SegmentID = sc.SegmentID
WHERE sc.AverageOrderValue > sc.SegmentMedianAOV
ORDER BY cs.SegmentName, AmountAboveMedian DESC, c.CustomerNumber;
