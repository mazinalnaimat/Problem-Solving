USE WindowFunctionsTrainingDB;
GO

SELECT
    ResultID,
    AthleteName,
    TeamName,
    RaceDate,
    Points,
    STDEVP(CAST(Points AS decimal(10,2))) OVER
    (
        PARTITION BY AthleteName
        ORDER BY RaceDate, ResultID
    ) AS AthleteNameRunningPointPopulationDeviation,
    STDEVP(CAST(Points AS decimal(10,2))) OVER
    (
        PARTITION BY TeamName
        ORDER BY RaceDate, ResultID
    ) AS TeamNameRunningPointPopulationDeviation
FROM dbo.RaceResults
WHERE Points IS NOT NULL
ORDER BY AthleteName, RaceDate, ResultID;
