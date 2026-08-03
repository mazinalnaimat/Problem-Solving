USE WindowFunctionsTrainingDB;
GO

SELECT
    ResultID,
    AthleteName,
    TeamName,
    RaceDate,
    FinishSeconds,
    VAR(FinishSeconds) OVER
    (
        PARTITION BY AthleteName
        ORDER BY RaceDate, ResultID
    ) AS AthleteNameRunningFinishSampleVariance,
    VAR(FinishSeconds) OVER
    (
        PARTITION BY TeamName
        ORDER BY RaceDate, ResultID
    ) AS TeamNameRunningFinishSampleVariance
FROM dbo.RaceResults
WHERE FinishSeconds IS NOT NULL
ORDER BY AthleteName, RaceDate, ResultID;
