USE RetailOperations3NFDB;
GO

;WITH CustomerActivity AS
(
    SELECT
        c.CustomerID,
        c.SegmentID,
        COUNT(o.OrderID) AS OrderCount
    FROM dbo.Customers c
    LEFT JOIN dbo.SalesOrders o
      ON o.CustomerID = c.CustomerID
     AND o.OrderStatusID <> 6
    GROUP BY c.CustomerID, c.SegmentID
),
FrequencyPosition AS
(
    SELECT
        ca.*,
        PERCENT_RANK() OVER
        (
            PARTITION BY ca.SegmentID
            ORDER BY ca.OrderCount
        ) AS FrequencyPercentRank
    FROM CustomerActivity ca
)
SELECT
    cs.SegmentName,
    c.CustomerNumber,
    fp.OrderCount,
    CAST(fp.FrequencyPercentRank AS decimal(7,4)) AS FrequencyPercentRank
FROM FrequencyPosition fp
JOIN dbo.Customers c ON c.CustomerID = fp.CustomerID
JOIN dbo.CustomerSegments cs ON cs.SegmentID = fp.SegmentID
ORDER BY cs.SegmentName, fp.FrequencyPercentRank DESC, c.CustomerNumber;
