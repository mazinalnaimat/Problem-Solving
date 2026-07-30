USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select
      TripID,
      DriverName,
      DeliveryDate,
      DelayMinutes,
	  LEAD(DelayMinutes)
	  OVER
	  (
		partition by DriverName
		order by DeliveryDate, TripID
	  )
	  AS NextDeliveryDelay
from DeliveryTrips
order by DriverName, DeliveryDate, TripID;


