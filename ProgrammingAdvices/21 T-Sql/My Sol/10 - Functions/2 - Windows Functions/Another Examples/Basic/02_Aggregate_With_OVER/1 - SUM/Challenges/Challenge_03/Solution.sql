USE WindowFunctionsTrainingDB;
GO

SELECT
    ClassName,
    StudentName,
    Score,
    SUM(Score) OVER (PARTITION BY ClassName) AS SUM_ScoreInClass
FROM dbo.StudentScores
ORDER BY ClassName, StudentName;
