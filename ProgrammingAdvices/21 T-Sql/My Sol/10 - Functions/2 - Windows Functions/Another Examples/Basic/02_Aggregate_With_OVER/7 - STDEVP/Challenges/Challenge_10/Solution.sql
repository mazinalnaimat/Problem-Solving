USE WindowFunctionsTrainingDB;
GO

WITH FullGroupStats AS
(
    SELECT
        EventName,
        STDEVP(FinishSeconds) AS FullGroupFinishPopulationDeviation
    FROM dbo.RaceResults
    WHERE FinishSeconds IS NOT NULL
    GROUP BY EventName
)
SELECT
    d.ResultID,
    d.EventName,
    d.RaceDate,
    d.FinishSeconds,
    g.FullGroupFinishPopulationDeviation,
    STDEVP(d.FinishSeconds) OVER
    (
        PARTITION BY d.EventName
        ORDER BY d.RaceDate, d.ResultID
    ) AS RunningFinishPopulationDeviation
FROM dbo.RaceResults AS d
INNER JOIN FullGroupStats AS g
    ON g.EventName = d.EventName
WHERE d.FinishSeconds IS NOT NULL
ORDER BY d.EventName, d.RaceDate, d.ResultID;
