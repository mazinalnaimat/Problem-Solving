USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.



select
      TripID,
      Depot,
      DriverName,
      DelayMinutes,
	  PERCENT_RANK()
	  OVER
	  (
		partition by Depot
		order by DelayMinutes
	  )AS DelayMinsPerDepotPercentRank
from DeliveryTrips
where DelayMinutes is not null
order by Depot, DelayMinutes

