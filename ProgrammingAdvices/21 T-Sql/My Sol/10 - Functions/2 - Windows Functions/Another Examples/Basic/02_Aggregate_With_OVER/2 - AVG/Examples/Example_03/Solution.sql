USE WindowFunctionsTrainingDB;
GO

SELECT
    ClassName,
    StudentName,
    Score,
    AVG(Score) OVER
    (
        PARTITION BY ClassName
    ) AS AVG_ScoreInClass
FROM dbo.StudentScores
ORDER BY ClassName, StudentName;
