USE WindowFunctionsTrainingDB;
GO


select
      ProjectName,
      TaskTitle,
       EstimatedHours,
      NTILE(3) OVER
      (
        order by estimatedHours desc
      )AS EstimatedHourGroup
from Tasks
