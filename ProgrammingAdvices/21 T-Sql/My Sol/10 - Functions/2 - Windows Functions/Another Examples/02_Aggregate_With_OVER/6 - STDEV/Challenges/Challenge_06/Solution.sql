USE WindowFunctionsTrainingDB;
GO

SELECT
    ResultID,
    AthleteName,
    TeamName,
    RaceDate,
    FinishSeconds,
    STDEV(FinishSeconds) OVER
    (
        PARTITION BY AthleteName
        ORDER BY RaceDate, ResultID
    ) AS AthleteNameRunningFinishSampleDeviation,
    STDEV(FinishSeconds) OVER
    (
        PARTITION BY TeamName
        ORDER BY RaceDate, ResultID
    ) AS TeamNameRunningFinishSampleDeviation
FROM dbo.RaceResults
WHERE FinishSeconds IS NOT NULL
ORDER BY AthleteName, RaceDate, ResultID;
