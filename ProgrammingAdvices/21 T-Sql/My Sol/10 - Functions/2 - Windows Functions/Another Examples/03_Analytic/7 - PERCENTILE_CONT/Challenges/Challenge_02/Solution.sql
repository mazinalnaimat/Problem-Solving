USE WindowFunctionsTrainingDB;
GO

SELECT
    TripID,
    Depot,
    DelayMinutes,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY DelayMinutes)
        OVER (PARTITION BY Depot) AS PercentileValue
FROM dbo.DeliveryTrips
WHERE DelayMinutes IS NOT NULL
ORDER BY Depot, DelayMinutes;
