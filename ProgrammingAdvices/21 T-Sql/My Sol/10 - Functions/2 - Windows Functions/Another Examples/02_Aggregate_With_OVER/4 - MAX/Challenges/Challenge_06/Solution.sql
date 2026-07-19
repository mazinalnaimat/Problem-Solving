USE WindowFunctionsTrainingDB;
GO

SELECT
    ResultID,
    AthleteName,
    TeamName,
    RaceDate,
    EventName,
    Points,
    MAX(Points) OVER
    (
        PARTITION BY AthleteName
        ORDER BY RaceDate, ResultID
        ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING
    ) AS NextThreeMaximumPoints
FROM dbo.RaceResults
ORDER BY AthleteName, RaceDate, ResultID;
