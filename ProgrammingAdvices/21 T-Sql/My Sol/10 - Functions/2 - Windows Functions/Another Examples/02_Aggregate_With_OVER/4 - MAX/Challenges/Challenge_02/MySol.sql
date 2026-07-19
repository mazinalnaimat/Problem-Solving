USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


select
      TripID,
      DriverName,
      Depot,
      DeliveryDate,
      PackagesDelivered,
      MAX(PackagesDelivered)
      OVER
      (
        partition by DriverName
        order by DeliveryDate, TripID
        rows between 
        unbounded preceding and current row
      )AS MaxPackagesPerDriverSoFar
from DeliveryTrips
ORDER BY DriverName, DeliveryDate, TripID

