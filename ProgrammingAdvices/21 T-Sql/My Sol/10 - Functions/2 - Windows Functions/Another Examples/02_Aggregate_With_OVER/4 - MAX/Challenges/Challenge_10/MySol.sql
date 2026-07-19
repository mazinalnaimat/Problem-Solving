USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select 
      TripID,
      Depot,
      RouteCode,
      DriverName,
      DeliveryDate,
      DistanceKm,
	  MAX(DistanceKm)
	  OVER
	  (
		partition by Depot, RouteCode
	  )AS MaxDistancePerDepotRouteCode
from DeliveryTrips
ORDER BY Depot, RouteCode, DeliveryDate, TripID;

