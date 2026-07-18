USE WindowFunctionsTrainingDB;
GO

SELECT
    ProjectName,
    TaskTitle,
    EstimatedHours,
    DENSE_RANK() OVER (PARTITION BY ProjectName ORDER BY EstimatedHours DESC) AS DenseHoursRank
FROM dbo.Tasks
ORDER BY ProjectName, DenseHoursRank;
