USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
      TripID,
      Depot,
      RouteCode,
      DriverName,
      DeliveryDate,
      FuelLiters,
      AVG(FuelLiters)
      OVER
      (
        partition by Depot, RouteCode 
      )
      AS RouteAverageFuel
from DeliveryTrips
order by Depot, RouteCode, DeliveryDate, TripID
