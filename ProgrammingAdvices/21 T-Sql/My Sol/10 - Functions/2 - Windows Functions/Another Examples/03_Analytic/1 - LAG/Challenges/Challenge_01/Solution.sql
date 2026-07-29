USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    MachineCode,
    ReadingTime,
    TemperatureC,
    LAG(TemperatureC) OVER
    (
        PARTITION BY MachineCode
        ORDER BY ReadingTime, ReadingID
    ) AS PreviousTemperatureC
FROM dbo.MachineReadings
ORDER BY MachineCode, ReadingTime, ReadingID;
