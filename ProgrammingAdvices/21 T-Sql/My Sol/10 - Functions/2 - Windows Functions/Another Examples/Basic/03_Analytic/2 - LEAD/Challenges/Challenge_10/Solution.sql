USE WindowFunctionsTrainingDB;
GO

SELECT
    ResultID,
    TeamName,
    RaceDate,
    Points,
    LEAD(Points) OVER
    (
        PARTITION BY TeamName
        ORDER BY RaceDate, ResultID
    ) AS NextPoints
FROM dbo.RaceResults
ORDER BY TeamName, RaceDate, ResultID;
