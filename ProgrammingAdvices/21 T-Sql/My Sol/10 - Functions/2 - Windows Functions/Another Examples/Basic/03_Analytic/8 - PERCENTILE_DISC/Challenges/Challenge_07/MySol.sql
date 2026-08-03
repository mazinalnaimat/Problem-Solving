USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
     TrafficID,
     SiteName,
     Channel,
     Sessions,
     PERCENTILE_DISC(0.5)
     within group (order by Sessions)
     OVER
     (
        partition by SiteName, Channel
     )AS DiscreteP50Sessions
from WebsiteTraffic
where Sessions is not null
order by SiteName, Channel, Sessions;



