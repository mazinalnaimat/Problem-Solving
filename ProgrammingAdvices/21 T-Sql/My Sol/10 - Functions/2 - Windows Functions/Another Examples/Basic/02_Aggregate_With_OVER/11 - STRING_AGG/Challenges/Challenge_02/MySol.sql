USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

With DistinctRoute AS
(
    select Distinct Depot, RouteCode      
    from DeliveryTrips
)

select
      Depot,
      STRING_AGG(RouteCode, ', ')
      within group(order by RouteCode)
      AS RouteCodes
from DistinctRoute
group by Depot
order by Depot

