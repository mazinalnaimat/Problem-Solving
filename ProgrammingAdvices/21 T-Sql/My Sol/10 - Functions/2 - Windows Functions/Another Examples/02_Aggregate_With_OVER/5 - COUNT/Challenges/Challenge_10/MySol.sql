USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.


WITH RouteCounts AS
(
	select
		  TripID,
		  Depot,
		  RouteCode,
		  DriverName,
		  DeliveryDate,
		  DelayMinutes,
		  COUNT(*) 
		  OVER
		  (
	  		partition by Depot, RouteCode
		  ) AS DepotRouteTripCount,
		  COUNT(CASE when DelayMinutes > 10 then 1 END)
		  OVER
		  (
			partition by Depot, RouteCode
		  )AS DelayedRouteTripCount

	from DeliveryTrips
)
SELECT
    TripID,
    Depot,
    RouteCode,
    DriverName,
    DelayMinutes,
    DepotRouteTripCount,
    DelayedRouteTripCount,
    CAST(100.0 * DelayedRouteTripCount / NULLIF(DepotRouteTripCount, 0) AS decimal(6,2)) AS DelayedTripPercentage
FROM RouteCounts
ORDER BY Depot, RouteCode, DeliveryDate, TripID;



