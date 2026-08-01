USE WindowFunctionsTrainingDB;
GO

SELECT
    ClassName,
    StudentName,
    Score,
    CUME_DIST() OVER
    (
        PARTITION BY ClassName
        ORDER BY Score
    ) AS ScoreCumeDist
FROM dbo.StudentScores
ORDER BY ClassName, Score;
