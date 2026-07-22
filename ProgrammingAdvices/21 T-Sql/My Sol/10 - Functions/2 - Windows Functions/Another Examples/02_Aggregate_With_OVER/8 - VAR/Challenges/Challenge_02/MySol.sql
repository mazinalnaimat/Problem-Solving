USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      TripID,
      DriverName,
      DeliveryDate,
      FuelLiters,
      VAR(FuelLiters)
      OVER
      (
        partition by DriverName
        order by DeliveryDate, TripID
      )RunningFuelLitersPerDriverSamVar
from DeliveryTrips
where FuelLiters is not null 
order by DriverName, DeliveryDate, TripID;
