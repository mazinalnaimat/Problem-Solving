USE WindowFunctionsTrainingDB;
GO

select  
      ClassName,
      StudentName,
      Score,
      SUM(Score)
      OVER
      (
        partition by ClassName
      )
      AS TotalScoreInClass
from StudentScores;








