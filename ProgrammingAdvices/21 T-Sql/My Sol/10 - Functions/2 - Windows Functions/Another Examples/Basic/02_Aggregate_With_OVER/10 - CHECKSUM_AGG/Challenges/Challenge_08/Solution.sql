USE WindowFunctionsTrainingDB;
GO

SELECT
    Depot,
    CHECKSUM_AGG
    (
        DISTINCT CHECKSUM(DriverName)
    ) AS DistinctDriverNameChecksum
FROM dbo.DeliveryTrips
GROUP BY Depot
ORDER BY Depot;
