USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    MachineCode,
    ReadingTime,
    TemperatureC,
    PERCENT_RANK() OVER
    (
        PARTITION BY MachineCode
        ORDER BY TemperatureC
    ) AS DistributionValue
FROM dbo.MachineReadings
WHERE TemperatureC IS NOT NULL
ORDER BY MachineCode, TemperatureC;
