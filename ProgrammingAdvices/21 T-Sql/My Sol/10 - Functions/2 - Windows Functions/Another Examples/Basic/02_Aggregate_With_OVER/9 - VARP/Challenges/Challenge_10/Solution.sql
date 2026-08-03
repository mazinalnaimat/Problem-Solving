USE WindowFunctionsTrainingDB;
GO

WITH FullGroupStats AS
(
    SELECT
        TeamName,
        VARP(CAST(Points AS decimal(10,2))) AS FullGroupPointPopulationVariance
    FROM dbo.RaceResults
    WHERE Points IS NOT NULL
    GROUP BY TeamName
)
SELECT
    d.ResultID,
    d.TeamName,
    d.RaceDate,
    d.Points,
    g.FullGroupPointPopulationVariance,
    VARP(CAST(d.Points AS decimal(10,2))) OVER
    (
        PARTITION BY d.TeamName
        ORDER BY d.RaceDate, d.ResultID
    ) AS RunningPointPopulationVariance
FROM dbo.RaceResults AS d
INNER JOIN FullGroupStats AS g
    ON g.TeamName = d.TeamName
WHERE d.Points IS NOT NULL
ORDER BY d.TeamName, d.RaceDate, d.ResultID;
