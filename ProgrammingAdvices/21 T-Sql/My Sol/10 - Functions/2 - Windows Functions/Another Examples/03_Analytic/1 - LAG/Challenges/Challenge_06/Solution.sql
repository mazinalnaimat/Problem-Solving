USE WindowFunctionsTrainingDB;
GO

SELECT
    ResultID,
    AthleteName,
    RaceDate,
    FinishSeconds,
    LAG(FinishSeconds) OVER
    (
        PARTITION BY AthleteName
        ORDER BY RaceDate, ResultID
    ) AS PreviousFinishTime
FROM dbo.RaceResults
ORDER BY AthleteName, RaceDate, ResultID;
