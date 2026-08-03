USE WindowFunctionsTrainingDB;
GO

SELECT
    TicketID,
    AgentName,
    TeamName,
    OpenedAt,
    ResolutionMinutes,
    COUNT(ResolutionMinutes) OVER
    (
        PARTITION BY AgentName
        ORDER BY OpenedAt, TicketID
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS ResolvedInLastThreeTickets
FROM dbo.SupportTickets
ORDER BY AgentName, OpenedAt, TicketID;
