USE WindowFunctionsTrainingDB;
GO

SELECT
    ClassName,
    StudentName,
    Score,
    NTILE(3) OVER
    (
        PARTITION BY ClassName
        ORDER BY Score DESC, StudentName
    ) AS ScoreGroup
FROM dbo.StudentScores
ORDER BY ClassName, ScoreGroup, Score DESC;
