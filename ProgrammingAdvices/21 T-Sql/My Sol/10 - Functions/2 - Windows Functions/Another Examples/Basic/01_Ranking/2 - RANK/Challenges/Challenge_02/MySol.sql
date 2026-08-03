USE WindowFunctionsTrainingDB;
GO

select 
      ClassName,
      StudentName,
      Score
from
(
    select 
          ClassName,
          StudentName,
          Score,
          RANK() OVER
          (
            partition by ClassName
            Order By Score desc
          )as ScoreRank
    from StudentScores
) as x 
where ScoreRank = 1;