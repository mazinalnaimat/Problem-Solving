USE WindowFunctionsTrainingDB;
GO


select distinct
      ClassName,
      PERCENTILE_CONT(0.5)
      within group (order by Score)
      Over
      (
        partition by ClassName 
      )AS MedianScore
from StudentScores
order by ClassName


