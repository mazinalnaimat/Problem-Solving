USE WindowFunctionsTrainingDB;
GO

SELECT
    TicketID,
    AgentName,
    OpenedAt,
    ResolutionMinutes,
    LEAD(ResolutionMinutes) OVER
    (
        PARTITION BY AgentName
        ORDER BY OpenedAt, TicketID
    ) AS NextResolutionMinutes
FROM dbo.SupportTickets
ORDER BY AgentName, OpenedAt, TicketID;
