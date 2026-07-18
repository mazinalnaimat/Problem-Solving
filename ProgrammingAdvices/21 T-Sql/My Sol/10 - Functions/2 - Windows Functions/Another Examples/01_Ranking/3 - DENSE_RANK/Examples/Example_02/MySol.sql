USE WindowFunctionsTrainingDB;
GO



select
      ClassName,
      StudentName,
      Score,
      DENSE_RANK() OVER
      (
        partition by ClassName
        order by score desc
      )
      AS ScoreDenseRank
from StudentScores;