USE WindowFunctionsTrainingDB;
GO

SELECT
    TicketID,
    Priority,
    SatisfactionScore,
    PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY SatisfactionScore)
        OVER (PARTITION BY Priority) AS PercentileValue
FROM dbo.SupportTickets
WHERE SatisfactionScore IS NOT NULL
ORDER BY Priority, SatisfactionScore;
