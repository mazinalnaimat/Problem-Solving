USE WindowFunctionsTrainingDB;
GO

SELECT
    ResultID,
    EventName,
    FinishSeconds,
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY FinishSeconds)
        OVER (PARTITION BY EventName) AS PercentileValue
FROM dbo.RaceResults
WHERE FinishSeconds IS NOT NULL
ORDER BY EventName, FinishSeconds;
