USE WindowFunctionsTrainingDB;
GO

SELECT
    TicketID,
    AgentName,
    OpenedAt,
    ResolutionMinutes,
    LAG(ResolutionMinutes) OVER
    (
        PARTITION BY AgentName
        ORDER BY OpenedAt, TicketID
    ) AS PreviousResolutionMinutes
FROM dbo.SupportTickets
ORDER BY AgentName, OpenedAt, TicketID;
