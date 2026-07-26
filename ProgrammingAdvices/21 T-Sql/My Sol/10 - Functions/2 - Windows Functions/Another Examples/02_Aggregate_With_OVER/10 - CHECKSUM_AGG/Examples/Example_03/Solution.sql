USE WindowFunctionsTrainingDB;
GO

SELECT
    ClassName,
    StudentName,
    ScoreID,
    CHECKSUM_AGG(ScoreID) OVER
    (
        PARTITION BY ClassName
    ) AS ScoreChecksumInClass
FROM dbo.StudentScores
ORDER BY ClassName, ScoreID;
