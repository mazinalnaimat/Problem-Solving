USE WindowFunctionsTrainingDB;
GO

SELECT
    ResultID,
    AthleteName,
    TeamName,
    RaceDate,
    EventName,
    FinishSeconds,
    MIN(FinishSeconds) OVER
    (
        PARTITION BY AthleteName
        ORDER BY RaceDate, ResultID
        ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING
    ) AS NextThreeFastestTime
FROM dbo.RaceResults
ORDER BY AthleteName, RaceDate, ResultID;
