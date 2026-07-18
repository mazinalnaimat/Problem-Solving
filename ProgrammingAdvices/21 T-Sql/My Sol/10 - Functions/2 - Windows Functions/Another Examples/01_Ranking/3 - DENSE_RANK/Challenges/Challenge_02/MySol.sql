USE WindowFunctionsTrainingDB;
GO

WITH StudentScoresDenseRankPerClassName AS
(
select
      ClassName,
      StudentName,
      Score,
      RANK() OVER
      (
        partition by ClassName
        order by Score desc
      )
      AS DenseScoreRank

from StudentScores
)

select * from StudentScoresDenseRankPerClassName
where DenseScoreRank <=2














