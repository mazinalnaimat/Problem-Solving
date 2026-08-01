USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    MachineCode,
    ReadingTime,
    TemperatureC,
    CUME_DIST() OVER
    (
        PARTITION BY MachineCode
        ORDER BY TemperatureC
    ) AS DistributionValue
FROM dbo.MachineReadings
WHERE TemperatureC IS NOT NULL
ORDER BY MachineCode, TemperatureC;
