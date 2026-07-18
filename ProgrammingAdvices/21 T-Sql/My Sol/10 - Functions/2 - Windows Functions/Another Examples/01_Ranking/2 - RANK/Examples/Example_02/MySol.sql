USE WindowFunctionsTrainingDB;
GO

select
      ClassName,
      StudentName,
      Score,
      Rank() over
      (
        partition by ClassName
        order by score desc
      )
      as ScoreRanck
from StudentScores


