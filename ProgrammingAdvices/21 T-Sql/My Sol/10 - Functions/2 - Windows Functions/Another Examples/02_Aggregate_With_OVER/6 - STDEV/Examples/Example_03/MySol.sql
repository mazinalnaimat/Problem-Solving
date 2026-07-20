USE WindowFunctionsTrainingDB;
GO

select 
      ClassName,
      StudentName,
      Score,
	  STDEV(Score)
	  OVER
	  (
		partition by ClassName
	  )AS STDEV_ScoresPerClass
from StudentScores
ORDER BY ClassName, StudentName;


