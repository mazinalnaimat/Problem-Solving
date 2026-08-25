USE RetailOperations3NFDB;
GO

;WITH StatusTransitions AS
(
    SELECT
        osh.OrderID,
        osh.OrderStatusID,
        osh.ChangedAt AS StageStartedAt,
        LEAD(osh.ChangedAt) OVER
        (
            PARTITION BY osh.OrderID
            ORDER BY osh.ChangedAt, osh.OrderStatusHistoryID
        ) AS NextStatusAt
    FROM dbo.OrderStatusHistory osh
),
StageDurations AS
(
    SELECT
        st.*,
        DATEDIFF(MINUTE, st.StageStartedAt, st.NextStatusAt) / 60.0 AS StageHours
    FROM StatusTransitions st
    WHERE st.NextStatusAt IS NOT NULL
),
RankedStages AS
(
    SELECT
        sd.*,
        ROW_NUMBER() OVER
        (
            PARTITION BY sd.OrderID
            ORDER BY sd.StageHours DESC, sd.StageStartedAt
        ) AS BottleneckRank
    FROM StageDurations sd
)
SELECT
    o.OrderNumber,
    os.StatusName AS BottleneckStatus,
    rs.StageStartedAt,
    rs.NextStatusAt,
    CAST(rs.StageHours AS decimal(10,2)) AS StageHours
FROM RankedStages rs
JOIN dbo.SalesOrders o ON o.OrderID = rs.OrderID
JOIN dbo.OrderStatuses os ON os.OrderStatusID = rs.OrderStatusID
WHERE rs.BottleneckRank = 1
ORDER BY rs.StageHours DESC, o.OrderNumber;
