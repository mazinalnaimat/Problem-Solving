USE WindowFunctionsTrainingDB;
GO

SELECT
    ResultID,
    TeamName,
    RaceDate,
    Points,
    LAG(Points) OVER
    (
        PARTITION BY TeamName
        ORDER BY RaceDate, ResultID
    ) AS PreviousPoints
FROM dbo.RaceResults
ORDER BY TeamName, RaceDate, ResultID;
