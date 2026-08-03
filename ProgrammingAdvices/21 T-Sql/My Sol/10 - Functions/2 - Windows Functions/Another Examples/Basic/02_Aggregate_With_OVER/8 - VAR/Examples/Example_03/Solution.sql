USE WindowFunctionsTrainingDB;
GO

SELECT
    ClassName,
    StudentName,
    Score,
    VAR(Score) OVER
    (
        PARTITION BY ClassName
    ) AS VAR_ScoreInClass
FROM dbo.StudentScores
ORDER BY ClassName, StudentName;
