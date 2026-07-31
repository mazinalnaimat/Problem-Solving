USE WindowFunctionsTrainingDB;
GO

SELECT
    ClassName,
    StudentName,
    Score,
    FIRST_VALUE(Score) OVER
    (
        PARTITION BY ClassName
        ORDER BY Score DESC, StudentName
    ) AS TopScoreInClass
FROM dbo.StudentScores
ORDER BY ClassName, Score DESC;
