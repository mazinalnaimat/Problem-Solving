USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    MachineCode,
    ProductionLine,
    ReadingTime,
    TemperatureC,
    AVG(TemperatureC) OVER
    (
        PARTITION BY ProductionLine
    ) AS LineAverageTemperature
FROM dbo.MachineReadings
ORDER BY ProductionLine;
