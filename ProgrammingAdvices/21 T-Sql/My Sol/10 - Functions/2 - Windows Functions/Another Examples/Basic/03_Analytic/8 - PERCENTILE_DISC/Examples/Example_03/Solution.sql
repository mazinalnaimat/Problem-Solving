USE WindowFunctionsTrainingDB;
GO

SELECT DISTINCT
    ClassName,
    PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY Score) OVER
    (
        PARTITION BY ClassName
    ) AS DiscreteMedianScore
FROM dbo.StudentScores
ORDER BY ClassName;
