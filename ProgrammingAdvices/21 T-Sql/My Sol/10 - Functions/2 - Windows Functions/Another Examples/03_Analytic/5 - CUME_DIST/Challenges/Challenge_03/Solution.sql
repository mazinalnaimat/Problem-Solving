USE WindowFunctionsTrainingDB;
GO

SELECT
    TicketID,
    TeamName,
    AgentName,
    ResolutionMinutes,
    CUME_DIST() OVER
    (
        PARTITION BY TeamName
        ORDER BY ResolutionMinutes
    ) AS DistributionValue
FROM dbo.SupportTickets
WHERE ResolutionMinutes IS NOT NULL
ORDER BY TeamName, ResolutionMinutes;
