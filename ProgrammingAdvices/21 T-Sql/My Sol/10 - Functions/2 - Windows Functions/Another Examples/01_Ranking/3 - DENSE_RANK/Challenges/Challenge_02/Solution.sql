USE WindowFunctionsTrainingDB;
GO

WITH x AS
(
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY ClassName ORDER BY Score DESC) AS dr
    FROM dbo.StudentScores
)
SELECT ClassName, StudentName, Score, dr
FROM x
WHERE dr <= 2
ORDER BY ClassName, dr, StudentName;
