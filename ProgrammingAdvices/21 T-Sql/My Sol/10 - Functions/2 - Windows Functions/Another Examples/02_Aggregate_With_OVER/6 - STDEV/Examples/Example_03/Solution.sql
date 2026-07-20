USE WindowFunctionsTrainingDB;
GO

SELECT
    ClassName,
    StudentName,
    Score,
    STDEV(Score) OVER
    (
        PARTITION BY ClassName
    ) AS STDEV_ScoreInClass
FROM dbo.StudentScores
ORDER BY ClassName, StudentName;
