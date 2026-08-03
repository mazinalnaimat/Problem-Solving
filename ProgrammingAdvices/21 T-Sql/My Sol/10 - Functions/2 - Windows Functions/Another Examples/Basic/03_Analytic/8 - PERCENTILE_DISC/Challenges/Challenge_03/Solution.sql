USE WindowFunctionsTrainingDB;
GO

SELECT
    TicketID,
    TeamName,
    ResolutionMinutes,
    PERCENTILE_DISC(0.60) WITHIN GROUP (ORDER BY ResolutionMinutes)
        OVER (PARTITION BY TeamName) AS PercentileValue
FROM dbo.SupportTickets
WHERE ResolutionMinutes IS NOT NULL
ORDER BY TeamName, ResolutionMinutes;
