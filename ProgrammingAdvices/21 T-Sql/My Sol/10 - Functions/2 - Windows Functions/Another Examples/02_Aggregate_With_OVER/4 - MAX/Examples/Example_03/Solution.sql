USE WindowFunctionsTrainingDB;
GO

SELECT
    ClassName,
    StudentName,
    Score,
    MAX(Score) OVER
    (
        PARTITION BY ClassName
    ) AS MAX_ScoreInClass
FROM dbo.StudentScores
ORDER BY ClassName, StudentName;
