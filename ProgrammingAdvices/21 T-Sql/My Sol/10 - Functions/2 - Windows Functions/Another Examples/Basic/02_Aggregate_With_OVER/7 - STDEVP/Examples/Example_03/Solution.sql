USE WindowFunctionsTrainingDB;
GO

SELECT
    ClassName,
    StudentName,
    Score,
    STDEVP(Score) OVER
    (
        PARTITION BY ClassName
    ) AS STDEVP_ScoreInClass
FROM dbo.StudentScores
ORDER BY ClassName, StudentName;
