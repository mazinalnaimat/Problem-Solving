USE WindowFunctionsTrainingDB;
GO

select 
     ClassName,
     StudentName,
     Score,
	 COUNT(*)
	 OVER
	 (
		partition by ClassName 
	 )AS ScoreCountPerClass
from StudentScores
ORDER BY ClassName, StudentName;
