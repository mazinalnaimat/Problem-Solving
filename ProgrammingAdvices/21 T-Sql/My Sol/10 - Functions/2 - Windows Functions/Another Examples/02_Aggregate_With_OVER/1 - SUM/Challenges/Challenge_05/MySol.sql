USE WindowFunctionsTrainingDB;
GO


select 
      ProjectName,
      TaskTitle,
      EstimatedHours,
      SUM(EstimatedHours) OVER
      (
        partition by ProjectName
      )
      AS TotalExtimatedHours
from Tasks






