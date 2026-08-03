USE WindowFunctionsTrainingDB;
GO

SELECT
    TicketID,
    AgentName,
    OpenedAt,
    ResolutionMinutes,
    LAST_VALUE(ResolutionMinutes) OVER
    (
        PARTITION BY AgentName
        ORDER BY OpenedAt, TicketID
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS LastResolutionMinutes
FROM dbo.SupportTickets
ORDER BY AgentName, OpenedAt, TicketID;
