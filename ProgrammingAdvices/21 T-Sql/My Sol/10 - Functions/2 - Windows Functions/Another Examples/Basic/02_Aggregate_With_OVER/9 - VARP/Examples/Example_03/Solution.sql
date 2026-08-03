USE WindowFunctionsTrainingDB;
GO

SELECT
    ClassName,
    StudentName,
    Score,
    VARP(Score) OVER
    (
        PARTITION BY ClassName
    ) AS VARP_ScoreInClass
FROM dbo.StudentScores
ORDER BY ClassName, StudentName;
