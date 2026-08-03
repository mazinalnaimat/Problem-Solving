USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    MachineCode,
    ReadingTime,
    TemperatureC,
    LEAD(TemperatureC) OVER
    (
        PARTITION BY MachineCode
        ORDER BY ReadingTime, ReadingID
    ) AS NextTemperatureC
FROM dbo.MachineReadings
ORDER BY MachineCode, ReadingTime, ReadingID;
