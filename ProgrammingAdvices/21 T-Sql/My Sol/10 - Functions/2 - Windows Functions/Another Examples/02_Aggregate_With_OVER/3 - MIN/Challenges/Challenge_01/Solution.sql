USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    MachineCode,
    ProductionLine,
    ReadingTime,
    TemperatureC,
    MIN(TemperatureC) OVER
    (
        PARTITION BY ProductionLine
    ) AS LineMinimumTemperature
FROM dbo.MachineReadings
ORDER BY ProductionLine;
