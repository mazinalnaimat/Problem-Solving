USE WindowFunctionsTrainingDB;
GO

SELECT
    TicketID,
    TeamName,
    Priority,
    CHECKSUM_AGG(TicketID) OVER
    (
        PARTITION BY TeamName
    ) AS TeamTicketChecksum,
    CHECKSUM_AGG(TicketID) OVER
    (
        PARTITION BY TeamName, Priority
    ) AS TeamPriorityTicketChecksum
FROM dbo.SupportTickets
ORDER BY TeamName, Priority, TicketID;
