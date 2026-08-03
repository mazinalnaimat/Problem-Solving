USE WindowFunctionsTrainingDB;
GO

SELECT
    TicketID,
    TeamName,
    Priority,
    OpenedAt,
    SatisfactionScore,
    STDEVP(CAST(SatisfactionScore AS decimal(10,2))) OVER
    (
        PARTITION BY TeamName, Priority
        ORDER BY OpenedAt, TicketID
    ) AS RunningSatisfactionPopulationDeviationByTwoGroups
FROM dbo.SupportTickets
WHERE SatisfactionScore IS NOT NULL
ORDER BY TeamName, Priority, OpenedAt, TicketID;
