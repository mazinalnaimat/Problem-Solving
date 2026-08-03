USE WindowFunctionsTrainingDB;
GO


select 
      ClassName,
      StudentName,
      Score,
      LAST_VALUE(Score)
      OVER
      (
        partition by ClassName
        order by Score DESC, StudentName
        rows between
        unbounded preceding and unbounded following
      )AS LowestScoreInClass
from StudentScores
order by ClassName, Score Desc
