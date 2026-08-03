USE WindowFunctionsTrainingDB;
GO

SELECT
    ResultID,
    AthleteName,
    EventName,
    RaceDate,
    FinishSeconds,
    VARP(FinishSeconds) OVER
    (
        PARTITION BY AthleteName
        ORDER BY RaceDate, ResultID
    ) AS AthleteNameRunningFinishPopulationVariance,
    VARP(FinishSeconds) OVER
    (
        PARTITION BY EventName
        ORDER BY RaceDate, ResultID
    ) AS EventNameRunningFinishPopulationVariance
FROM dbo.RaceResults
WHERE FinishSeconds IS NOT NULL
ORDER BY AthleteName, RaceDate, ResultID;
