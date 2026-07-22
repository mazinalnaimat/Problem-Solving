USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.
WITH OverAllStats AS 
(
    select
          TeamName,
          VAR(CAST(Points AS decimal(10,2))) AS OverallPointSamVar
    from RaceResults
    where Points is not null
    group by TeamName
)
SELECT
    RR.ResultID,
    RR.TeamName,
    RR.RaceDate,
    RR.Points,
    OAS.OverallPointSamVar,
    VAR(CAST(RR.Points AS decimal(10,2))) OVER
    (
        partition by RR.TeamName
        order by RR.RaceDate, RR.ResultID
    ) AS RunningPointSampleVariance
from dbo.RaceResults AS RR
join OverAllStats AS OAS
on OAS.TeamName = RR.TeamName
where  RR.Points is not null
order by RR.TeamName, RR.RaceDate, RR.ResultID;



