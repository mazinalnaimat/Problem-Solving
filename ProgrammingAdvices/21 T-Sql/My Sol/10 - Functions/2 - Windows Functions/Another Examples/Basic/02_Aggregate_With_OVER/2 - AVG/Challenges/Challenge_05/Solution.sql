USE WindowFunctionsTrainingDB;
GO

SELECT
    ProjectName,
    TaskTitle,
    EstimatedHours,
    AVG(EstimatedHours) OVER (PARTITION BY ProjectName) AS AVG_HoursInProject
FROM dbo.Tasks
ORDER BY ProjectName, TaskTitle;
