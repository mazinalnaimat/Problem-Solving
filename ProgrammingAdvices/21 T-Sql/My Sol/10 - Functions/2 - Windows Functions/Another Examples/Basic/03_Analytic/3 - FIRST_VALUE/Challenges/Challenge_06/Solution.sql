USE WindowFunctionsTrainingDB;
GO

SELECT
    ResultID,
    AthleteName,
    RaceDate,
    FinishSeconds,
    FIRST_VALUE(FinishSeconds) OVER
    (
        PARTITION BY AthleteName
        ORDER BY RaceDate, ResultID
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS FirstFinishSeconds
FROM dbo.RaceResults
ORDER BY AthleteName, RaceDate, ResultID;
