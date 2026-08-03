USE WindowFunctionsTrainingDB;
GO


select
      ClassName,
      StudentName,
      Score,
	  MAX(Score)
	  OVER
	  (
		partition by ClassName
	  )AS MaxScorePerClass
from StudentScores
order by ClassName, StudentName;
