USE WindowFunctionsTrainingDB;
GO

SELECT
    ResultID,
    TeamName,
    AthleteName,
    Points,
    FIRST_VALUE(Points) OVER
    (
        PARTITION BY TeamName
        ORDER BY Points DESC, ResultID
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS FirstPoints
FROM dbo.RaceResults
ORDER BY TeamName, Points DESC, ResultID;
