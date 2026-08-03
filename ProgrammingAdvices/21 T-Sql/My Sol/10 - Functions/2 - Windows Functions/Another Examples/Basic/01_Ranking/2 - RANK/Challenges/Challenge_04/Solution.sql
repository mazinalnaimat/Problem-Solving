USE WindowFunctionsTrainingDB;
GO

WITH x AS
(
    SELECT ClassName, AVG(CAST(Score AS DECIMAL(10,2))) AS AvgScore
    FROM dbo.StudentScores
    GROUP BY ClassName
)
SELECT
    ClassName,
    AvgScore,
    RANK() OVER (ORDER BY AvgScore DESC) AS ClassRank
FROM x
ORDER BY ClassRank;
