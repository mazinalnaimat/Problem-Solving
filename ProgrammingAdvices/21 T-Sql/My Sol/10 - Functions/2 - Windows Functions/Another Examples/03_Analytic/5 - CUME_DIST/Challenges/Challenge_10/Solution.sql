USE WindowFunctionsTrainingDB;
GO

SELECT
    TicketID,
    Priority,
    TeamName,
    SatisfactionScore,
    CUME_DIST() OVER
    (
        PARTITION BY Priority
        ORDER BY SatisfactionScore
    ) AS DistributionValue
FROM dbo.SupportTickets
WHERE SatisfactionScore IS NOT NULL
ORDER BY Priority, SatisfactionScore;
