USE WindowFunctionsTrainingDB;
GO


select 
      ClassName,
      StudentName,
      Score,
      CUME_DIST()
      OVER
      (
        partition by ClassName 
        order by Score
      )AS ScorePerClassCumeDist
from StudentScores
order by ClassName, Score;
