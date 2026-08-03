USE WindowFunctionsTrainingDB;
GO

SELECT
    ResultID,
    AthleteName,
    TeamName,
    RaceDate,
    EventName,
    Points,
    SUM(Points) OVER
    (
        PARTITION BY AthleteName
        ORDER BY RaceDate, ResultID
        ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING
    ) AS NextThreeRacePoints
FROM dbo.RaceResults
ORDER BY AthleteName, RaceDate, ResultID;
