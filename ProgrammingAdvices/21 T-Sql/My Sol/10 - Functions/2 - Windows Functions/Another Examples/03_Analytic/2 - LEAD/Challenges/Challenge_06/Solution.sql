USE WindowFunctionsTrainingDB;
GO

SELECT
    ResultID,
    AthleteName,
    RaceDate,
    FinishSeconds,
    LEAD(FinishSeconds) OVER
    (
        PARTITION BY AthleteName
        ORDER BY RaceDate, ResultID
    ) AS NextFinishTime
FROM dbo.RaceResults
ORDER BY AthleteName, RaceDate, ResultID;
