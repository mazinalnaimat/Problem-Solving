USE WindowFunctionsTrainingDB;
GO

SELECT
    ProjectName,
    TaskTitle,
    CreatedDate,
    ROW_NUMBER() OVER
    (
        PARTITION BY ProjectName
        ORDER BY CreatedDate, TaskID
    ) AS TaskNumber
FROM dbo.Tasks
ORDER BY ProjectName, TaskNumber;
