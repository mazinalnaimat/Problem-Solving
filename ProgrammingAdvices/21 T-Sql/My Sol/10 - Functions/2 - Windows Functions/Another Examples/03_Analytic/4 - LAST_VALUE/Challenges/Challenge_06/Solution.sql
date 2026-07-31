USE WindowFunctionsTrainingDB;
GO

SELECT
    ResultID,
    AthleteName,
    RaceDate,
    FinishSeconds,
    LAST_VALUE(FinishSeconds) OVER
    (
        PARTITION BY AthleteName
        ORDER BY RaceDate, ResultID
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS LastFinishSeconds
FROM dbo.RaceResults
ORDER BY AthleteName, RaceDate, ResultID;
