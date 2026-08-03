USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    MachineCode,
    TemperatureC,
    PERCENTILE_DISC(0.50) WITHIN GROUP (ORDER BY TemperatureC)
        OVER (PARTITION BY MachineCode) AS PercentileValue
FROM dbo.MachineReadings
WHERE TemperatureC IS NOT NULL
ORDER BY MachineCode, TemperatureC;
