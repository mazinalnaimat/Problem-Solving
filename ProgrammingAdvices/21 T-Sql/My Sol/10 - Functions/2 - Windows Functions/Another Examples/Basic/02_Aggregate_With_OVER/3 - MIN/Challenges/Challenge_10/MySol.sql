USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      TripID,
      Depot,
      RouteCode,
      DriverName,
      DeliveryDate,
      PackagesDelivered,
      MIN(PackagesDelivered)
      OVER
      (
         partition by Depot, RouteCode 
      )AS DepotRouteMinPackages
from DeliveryTrips
ORDER BY Depot, RouteCode, DeliveryDate, TripID;
