USE WindowFunctionsTrainingDB;
GO

select * from StudentScores;

select 
      ClassName,
      STRING_AGG(StudentName, ', ')
      within group (order by StudentName)
      AS Students
from StudentScores
group by ClassName
order by ClassName
