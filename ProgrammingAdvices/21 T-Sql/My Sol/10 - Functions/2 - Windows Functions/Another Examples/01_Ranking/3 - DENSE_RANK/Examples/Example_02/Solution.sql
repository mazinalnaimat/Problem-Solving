USE WindowFunctionsTrainingDB;
GO

SELECT
    ClassName,
    StudentName,
    Score,
    DENSE_RANK() OVER
    (
        PARTITION BY ClassName
        ORDER BY Score DESC
    ) AS DenseScoreRank
FROM dbo.StudentScores
ORDER BY ClassName, DenseScoreRank, StudentName;
