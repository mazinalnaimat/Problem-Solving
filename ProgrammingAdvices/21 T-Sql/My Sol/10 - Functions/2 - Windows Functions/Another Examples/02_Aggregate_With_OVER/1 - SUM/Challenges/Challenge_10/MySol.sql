USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

select 
	 TripID,
     Depot,
     RouteCode,
     DriverName,
     DeliveryDate,
     DelayMinutes,
	 SUM(DelayMinutes)
	 OVER
	 (
		partition by Depot, RouteCode
	    ORDER BY DeliveryDate, TripID
        ROWS BETWEEN
		UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS RouteDelayTotal
from DeliveryTrips
ORDER BY Depot, RouteCode, DeliveryDate, TripID;

