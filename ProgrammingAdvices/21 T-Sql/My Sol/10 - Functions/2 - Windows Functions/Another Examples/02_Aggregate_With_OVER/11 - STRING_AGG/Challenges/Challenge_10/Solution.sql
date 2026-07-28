USE WindowFunctionsTrainingDB;
GO

WITH DelayedDrivers AS
(
    SELECT DISTINCT Depot, DriverName
    FROM dbo.DeliveryTrips
    WHERE DelayMinutes > 10
)
SELECT
    Depot,
    STRING_AGG
    (
        CONVERT(nvarchar(max), DriverName),
        CHAR(13) + CHAR(10)
    ) WITHIN GROUP (ORDER BY DriverName) AS DelayedDrivers
FROM DelayedDrivers
GROUP BY Depot
ORDER BY Depot;
