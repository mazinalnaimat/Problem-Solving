USE WindowFunctionsTrainingDB;
GO

SELECT
    ResultID,
    AthleteName,
    TeamName,
    RaceDate,
    EventName,
    FinishSeconds,
    AVG(FinishSeconds) OVER
    (
        PARTITION BY AthleteName
        ORDER BY RaceDate, ResultID
        ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING
    ) AS NextThreeAverageFinish
FROM dbo.RaceResults
ORDER BY AthleteName, RaceDate, ResultID;
