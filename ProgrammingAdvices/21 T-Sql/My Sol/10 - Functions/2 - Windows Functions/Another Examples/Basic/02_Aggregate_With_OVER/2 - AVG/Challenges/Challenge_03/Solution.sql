USE WindowFunctionsTrainingDB;
GO

SELECT
    TicketID,
    AgentName,
    TeamName,
    OpenedAt,
    ResolutionMinutes,
    AVG(CAST(ResolutionMinutes AS decimal(10,2))) OVER
    (
        PARTITION BY AgentName
        ORDER BY OpenedAt, TicketID
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS MovingAverageResolution
FROM dbo.SupportTickets
ORDER BY AgentName, OpenedAt, TicketID;
