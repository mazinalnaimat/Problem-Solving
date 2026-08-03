USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    ReadingTime,
    TemperatureC,
    STDEV(TemperatureC) OVER
    (
        ORDER BY ReadingTime, ReadingID
    ) AS OverallRunningTemperatureSampleDeviation
FROM dbo.MachineReadings
WHERE TemperatureC IS NOT NULL
ORDER BY ReadingTime, ReadingID;
