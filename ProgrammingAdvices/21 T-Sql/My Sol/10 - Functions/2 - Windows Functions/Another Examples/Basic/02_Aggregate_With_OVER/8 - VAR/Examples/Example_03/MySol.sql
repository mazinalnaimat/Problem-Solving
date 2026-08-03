USE WindowFunctionsTrainingDB;
GO

select
      ClassName,
      StudentName,
      Score,
      VAR(Score)
      OVER
      (
         partition by ClassName
      )AS ScorePerClassSamVar
from StudentScores
ORDER BY ClassName, StudentName;



