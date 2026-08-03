USE WindowFunctionsTrainingDB;
GO

SELECT
    TicketID,
    TeamName,
    Priority,
    OpenedAt,
    ResolutionMinutes,
    VAR(CAST(ResolutionMinutes AS decimal(10,2))) OVER
    (
        PARTITION BY TeamName, Priority
        ORDER BY OpenedAt, TicketID
    ) AS RunningResolutionSampleVarianceByTwoGroups
FROM dbo.SupportTickets
WHERE ResolutionMinutes IS NOT NULL
ORDER BY TeamName, Priority, OpenedAt, TicketID;
