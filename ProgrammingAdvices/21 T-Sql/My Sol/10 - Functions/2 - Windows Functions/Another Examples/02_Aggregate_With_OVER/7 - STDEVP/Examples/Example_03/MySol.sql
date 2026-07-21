USE WindowFunctionsTrainingDB;
GO


select 
      ClassName,
      StudentName,
      Score,
	  STDEVP(Score)
	  OVER
	  (
		partition by ClassName 
	  )AS ScorePerClassPopStdDev
from StudentScores
order by ClassName, StudentName;



