USE WindowFunctionsTrainingDB;
GO

Select 
      ProjectName,
      TaskTitle,
      EstimatedHours,
      DENSE_RANK() OVER
      (
        partition by ProjectName
        order by EstimatedHours Desc
      )
      AS DneseEstimatedHoursRank

from Tasks












