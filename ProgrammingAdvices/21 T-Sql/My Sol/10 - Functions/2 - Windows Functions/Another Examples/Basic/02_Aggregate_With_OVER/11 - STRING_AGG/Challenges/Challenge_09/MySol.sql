USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

WITH TripCountPerDepotRoute as 
(
    select
          Depot,
          RouteCode,
          COUNT(*)AS TripCountPerDepotRoute
    from DeliveryTrips
    group by Depot, RouteCode

)

select 
      Depot,
      STRING_AGG
      (
        CONCAT(RouteCode, ' (', TripCountPerDepotRoute ,' trips)'),
        '; '
      )AS RouteSummery
from TripCountPerDepotRoute
group by Depot
order by Depot