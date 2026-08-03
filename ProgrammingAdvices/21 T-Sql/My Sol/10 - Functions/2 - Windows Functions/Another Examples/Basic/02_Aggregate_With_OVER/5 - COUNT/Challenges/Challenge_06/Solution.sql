USE WindowFunctionsTrainingDB;
GO

SELECT
    ResultID,
    EventName,
    AthleteName,
    RaceDate,
    COUNT(*) OVER
    (
        PARTITION BY EventName
        ORDER BY RaceDate, ResultID
        ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
    ) AS CenteredResultCount
FROM dbo.RaceResults
ORDER BY EventName, RaceDate, ResultID;
