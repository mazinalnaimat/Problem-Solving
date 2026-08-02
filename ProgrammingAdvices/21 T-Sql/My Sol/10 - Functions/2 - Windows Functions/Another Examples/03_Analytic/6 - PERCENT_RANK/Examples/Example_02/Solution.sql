USE WindowFunctionsTrainingDB;
GO

SELECT
    ClassName,
    StudentName,
    Score,
    PERCENT_RANK() OVER
    (
        PARTITION BY ClassName
        ORDER BY Score
    ) AS ScorePercentRank
FROM dbo.StudentScores
ORDER BY ClassName, Score;
