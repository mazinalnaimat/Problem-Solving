USE WindowFunctionsTrainingDB;
GO

WITH x AS
(
    SELECT *,
           RANK() OVER (PARTITION BY ClassName ORDER BY Score DESC) AS rnk
    FROM dbo.StudentScores
)
SELECT ClassName, StudentName, Score
FROM x
WHERE rnk = 1
ORDER BY ClassName, StudentName;
