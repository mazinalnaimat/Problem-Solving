USE WindowFunctionsTrainingDB;
GO

SELECT
    ProjectName,
    TaskTitle,
    EstimatedHours,
    SUM(EstimatedHours) OVER (PARTITION BY ProjectName) AS SUM_HoursInProject
FROM dbo.Tasks
ORDER BY ProjectName, TaskTitle;
