USE WindowFunctionsTrainingDB;
GO

SELECT
    TripID,
    Depot,
    DriverName,
    DelayMinutes,
    PERCENT_RANK() OVER
    (
        PARTITION BY Depot
        ORDER BY DelayMinutes
    ) AS DistributionValue
FROM dbo.DeliveryTrips
WHERE DelayMinutes IS NOT NULL
ORDER BY Depot, DelayMinutes;
