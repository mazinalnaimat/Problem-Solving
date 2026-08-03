USE WindowFunctionsTrainingDB;
GO

WITH FullGroupStats AS
(
    SELECT
        TeamName,
        VAR(CAST(Points AS decimal(10,2))) AS FullGroupPointSampleVariance
    FROM dbo.RaceResults
    WHERE Points IS NOT NULL
    GROUP BY TeamName
)
SELECT
    d.ResultID,
    d.TeamName,
    d.RaceDate,
    d.Points,
    g.FullGroupPointSampleVariance,
    VAR(CAST(d.Points AS decimal(10,2))) OVER
    (
        PARTITION BY d.TeamName
        ORDER BY d.RaceDate, d.ResultID
    ) AS RunningPointSampleVariance
FROM dbo.RaceResults AS d
INNER JOIN FullGroupStats AS g
    ON g.TeamName = d.TeamName
WHERE d.Points IS NOT NULL
ORDER BY d.TeamName, d.RaceDate, d.ResultID;
