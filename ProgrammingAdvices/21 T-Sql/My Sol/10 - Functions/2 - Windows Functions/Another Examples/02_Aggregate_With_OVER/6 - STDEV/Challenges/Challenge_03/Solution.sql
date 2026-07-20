USE WindowFunctionsTrainingDB;
GO

SELECT
    TicketID,
    TeamName,
    Priority,
    OpenedAt,
    ResolutionMinutes,
    STDEV(CAST(ResolutionMinutes AS decimal(10,2))) OVER
    (
        PARTITION BY TeamName
        ORDER BY OpenedAt, TicketID
    ) AS RunningResolutionSampleDeviationTeam
FROM dbo.SupportTickets
WHERE ResolutionMinutes IS NOT NULL
ORDER BY TeamName,  OpenedAt, TicketID;
