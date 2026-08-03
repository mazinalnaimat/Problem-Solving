USE WindowFunctionsTrainingDB;
GO

select 
      ClassName,
      StudentName,
      Score,
      AVG(Score)
      OVER
      (
        partition by ClassName
      )
      AS AvgScoreInClass
from StudentScores
ORDER BY ClassName, StudentName;

