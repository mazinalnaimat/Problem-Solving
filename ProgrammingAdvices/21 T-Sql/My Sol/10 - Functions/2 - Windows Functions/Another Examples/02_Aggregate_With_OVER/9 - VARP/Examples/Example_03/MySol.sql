USE WindowFunctionsTrainingDB;
GO

select 
     ClassName,
     StudentName,
     Score,
	 VARP(Score)
	 OVER
	 (
		partition by ClassName
	 )AS ScorePerClassPopVar
from StudentScores
order by ClassName, StudentName;
