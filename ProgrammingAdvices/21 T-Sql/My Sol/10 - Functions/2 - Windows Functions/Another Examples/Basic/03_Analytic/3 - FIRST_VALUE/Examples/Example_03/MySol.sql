USE WindowFunctionsTrainingDB;
GO

select    
      ClassName,
      StudentName,
      Score,
      FIRST_VALUE(Score)
      OVER
      (
        partition by ClassName
        order by Score DESC
      )AS TopScorePerClass
from StudentScores
ORDER BY ClassName, Score DESC;
