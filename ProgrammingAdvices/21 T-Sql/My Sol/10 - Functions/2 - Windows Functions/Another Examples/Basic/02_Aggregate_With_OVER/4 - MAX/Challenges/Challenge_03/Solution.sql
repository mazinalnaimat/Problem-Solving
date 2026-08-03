USE WindowFunctionsTrainingDB;
GO

SELECT
    TicketID,
    AgentName,
    TeamName,
    OpenedAt,
    ResolutionMinutes,
    MAX(ResolutionMinutes) OVER
    (
        PARTITION BY AgentName
        ORDER BY OpenedAt, TicketID
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS MovingMaximumResolution
FROM dbo.SupportTickets
ORDER BY AgentName, OpenedAt, TicketID;
