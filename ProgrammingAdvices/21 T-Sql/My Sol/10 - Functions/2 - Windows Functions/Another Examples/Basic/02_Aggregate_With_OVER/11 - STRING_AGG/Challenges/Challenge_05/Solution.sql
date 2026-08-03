USE WindowFunctionsTrainingDB;
GO

SELECT
    EventName,
    STRING_AGG
    (
        CONVERT(nvarchar(max), CONCAT(AthleteName, ' - ', FinishSeconds, ' sec')),
        ' | '
    ) WITHIN GROUP (ORDER BY FinishSeconds, ResultID) AS Leaderboard
FROM dbo.RaceResults
GROUP BY EventName
ORDER BY EventName;
