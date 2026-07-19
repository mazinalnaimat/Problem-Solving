USE WindowFunctionsTrainingDB;
GO

select 
      ScoreID,
      StudentName,
      ClassName,
      Score,
      MIN(Score)
      OVER
      (
        partition by ClassName
      )AS MinScorePerClassName
from StudentScores
ORDER BY ClassName, StudentName;
