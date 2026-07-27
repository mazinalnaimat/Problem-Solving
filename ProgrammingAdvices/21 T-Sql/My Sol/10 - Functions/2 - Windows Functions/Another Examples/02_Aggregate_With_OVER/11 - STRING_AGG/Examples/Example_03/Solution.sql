USE WindowFunctionsTrainingDB;
GO

SELECT
    ClassName,
    STRING_AGG(StudentName, ', ') WITHIN GROUP (ORDER BY StudentName) AS Students
FROM dbo.StudentScores
GROUP BY ClassName
ORDER BY ClassName;
