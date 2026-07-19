USE WindowFunctionsTrainingDB;
GO

SELECT
    ClassName,
    StudentName,
    Score,
    MIN(Score) OVER
    (
        PARTITION BY ClassName
    ) AS MIN_ScoreInClass
FROM dbo.StudentScores
ORDER BY ClassName, StudentName;
