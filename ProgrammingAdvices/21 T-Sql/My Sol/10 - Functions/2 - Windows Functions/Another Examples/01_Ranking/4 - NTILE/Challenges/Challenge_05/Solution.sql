USE WindowFunctionsTrainingDB;
GO

SELECT
    ProjectName,
    TaskTitle,
    EstimatedHours,
    NTILE(3) OVER (ORDER BY EstimatedHours DESC, TaskID) AS EffortGroup
FROM dbo.Tasks
ORDER BY EffortGroup, EstimatedHours DESC;
