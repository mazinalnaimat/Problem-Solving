USE WindowFunctionsTrainingDB;
GO

SELECT
    TeamName,
    STRING_AGG
    (
        CONVERT(nvarchar(max), CONCAT('[', Priority, '] ', TicketTitle)),
        '; '
    ) WITHIN GROUP (ORDER BY OpenedAt, TicketID) AS OpenTicketSummary
FROM dbo.SupportTickets
WHERE ClosedAt IS NULL
GROUP BY TeamName
ORDER BY TeamName;
