USE WindowFunctionsTrainingDB;
GO

SELECT
    ResultID,
    EventName,
    AthleteName,
    TeamName,
    Points,
    CHECKSUM_AGG
    (
        CHECKSUM(AthleteName, TeamName, Points)
    ) OVER
    (
        PARTITION BY EventName
    ) AS EventResultDataChecksum
FROM dbo.RaceResults
ORDER BY EventName, RaceDate, ResultID;
