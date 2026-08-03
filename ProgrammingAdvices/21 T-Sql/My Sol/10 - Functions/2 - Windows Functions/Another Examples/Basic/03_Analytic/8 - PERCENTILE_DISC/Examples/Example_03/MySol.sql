USE WindowFunctionsTrainingDB;
GO


select distinct
      ClassName,
      PERCENTILE_DISC(0.5)
      within group (order by Score)
      Over
      (
        partition by ClassName 
      )AS DiscreteMedianScore
from StudentScores
order by ClassName


