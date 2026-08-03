USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

With TeamStats as 
(
    select 
        TeamName,
        VARP(CAST(Points AS decimal(10,2))) AS PointPerTeamPopVar
    from RaceResults
    where Points is not null
    group by TeamName
)

SELECT
    RR.ResultID,
    RR.TeamName,
    RR.RaceDate,
    RR.Points,
    TS.PointPerTeamPopVar,
    VARP(CAST(RR.Points AS decimal(10,2))) 
    OVER
    (
        partition by RR.TeamName
        order by RR.RaceDate, RR.ResultID
    ) AS RunningPointPopulationVariance
from dbo.RaceResults AS RR
join TeamStats AS TS
on TS.TeamName = RR.TeamName
where RR.Points is not null
order by RR.TeamName, RR.RaceDate, RR.ResultID;

