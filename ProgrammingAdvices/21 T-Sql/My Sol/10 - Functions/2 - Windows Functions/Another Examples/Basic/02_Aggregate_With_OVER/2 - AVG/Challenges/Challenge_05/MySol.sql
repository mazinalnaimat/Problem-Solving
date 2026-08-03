USE WindowFunctionsTrainingDB;
GO

select 
      ProjectName,
      TaskTitle,
      EstimatedHours,
      AVG(EstimatedHours)
      OVER
      (
        partition by ProjectName
      )
      AS AvgEstimatedHoursInProject
from Tasks
ORDER BY ProjectName, TaskTitle;










