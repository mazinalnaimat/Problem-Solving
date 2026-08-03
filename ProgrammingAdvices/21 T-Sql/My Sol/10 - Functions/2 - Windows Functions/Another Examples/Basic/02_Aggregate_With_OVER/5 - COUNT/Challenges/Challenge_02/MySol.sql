USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      TripID,
      DriverName,
      Depot,
      DeliveryDate,
	  COUNT(*)
	  OVER
	  (
		Partition by DriverName
		order by DeliveryDate, TripID
		rows between 
		unbounded preceding and current row
	  )AS RunningTripCount
from DeliveryTrips
ORDER BY DriverName, DeliveryDate, TripID;



