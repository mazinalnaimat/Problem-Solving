USE WindowFunctionsTrainingDB;
GO

SELECT
    ClassName,
    StudentName,
    Score,
    COUNT(Score) OVER
    (
        PARTITION BY ClassName
    ) AS COUNT_ScoreInClass
FROM dbo.StudentScores
ORDER BY ClassName, StudentName;
