USE WindowFunctionsTrainingDB;
GO

SELECT
    ClassName,
    StudentName,
    Score,
    RANK() OVER
    (
        PARTITION BY ClassName
        ORDER BY Score DESC
    ) AS ScoreRank
FROM dbo.StudentScores
ORDER BY ClassName, ScoreRank, StudentName;
