USE WindowFunctionsTrainingDB;
GO

SELECT
    ClassName,
    StudentName,
    Score,
    LAST_VALUE(Score) OVER
    (
        PARTITION BY ClassName
        ORDER BY Score DESC, StudentName
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS LowestScoreInClass
FROM dbo.StudentScores
ORDER BY ClassName, Score DESC;
