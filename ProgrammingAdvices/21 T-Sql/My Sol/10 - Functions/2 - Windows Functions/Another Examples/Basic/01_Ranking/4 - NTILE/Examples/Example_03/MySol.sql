USE WindowFunctionsTrainingDB;
GO



select 
      ClassName,
      StudentName,
      Score,
      NTILE (4) OVER
      (
        partition by ClassName
        order by Score desc
      ) 
      AS ScoreGroup

from StudentScores;