USE WindowFunctionsTrainingDB;
GO


select
      ClassName,
      StudentName,
      Score,
      PERCENT_RANK()
      OVER
      (
        partition by ClassName
        order by Score 
      ) AS ScorePerClassPercentRank
from StudentScores
order by  ClassName, Score


