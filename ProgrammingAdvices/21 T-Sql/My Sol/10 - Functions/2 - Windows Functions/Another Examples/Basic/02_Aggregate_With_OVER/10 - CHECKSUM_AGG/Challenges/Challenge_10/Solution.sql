USE WindowFunctionsTrainingDB;
GO

WITH ClosedTickets AS
(
    SELECT
        TicketID,
        TeamName,
        ClosedAt,
        CHECKSUM_AGG(TicketID) OVER
        (
            PARTITION BY TeamName
        ) AS ClosedTicketChecksum
    FROM dbo.SupportTickets
    WHERE ClosedAt IS NOT NULL
)
SELECT
    TicketID,
    TeamName,
    ClosedAt,
    ClosedTicketChecksum
FROM ClosedTickets
ORDER BY TeamName, ClosedAt, TicketID;
