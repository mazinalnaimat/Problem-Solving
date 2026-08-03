USE WindowFunctionsTrainingDB;
GO

select
      ClassName,
      StudentName,
      ScoreID,
      CHECKSUM_AGG(ScoreID)
      OVER
      (
        partition by ClassName 
      )AS ScoreCheckSumInClass
from StudentScores
order by ClassName, ScoreID;
