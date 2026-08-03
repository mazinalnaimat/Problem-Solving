USE WindowFunctionsTrainingDB;
GO

SELECT
    ResultID,
    EventName,
    AthleteName,
    FinishSeconds,
    CUME_DIST() OVER
    (
        PARTITION BY EventName
        ORDER BY FinishSeconds
    ) AS DistributionValue
FROM dbo.RaceResults
WHERE FinishSeconds IS NOT NULL
ORDER BY EventName, FinishSeconds;
