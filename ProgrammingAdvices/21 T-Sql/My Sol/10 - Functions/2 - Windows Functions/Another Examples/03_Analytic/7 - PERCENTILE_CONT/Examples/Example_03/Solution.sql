USE WindowFunctionsTrainingDB;
GO

SELECT DISTINCT
    ClassName,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Score) OVER
    (
        PARTITION BY ClassName
    ) AS MedianScore
FROM dbo.StudentScores
ORDER BY ClassName;
