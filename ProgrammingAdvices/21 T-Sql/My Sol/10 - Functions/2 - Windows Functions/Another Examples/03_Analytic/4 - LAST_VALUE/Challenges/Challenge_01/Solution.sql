USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    MachineCode,
    ReadingTime,
    TemperatureC,
    LAST_VALUE(TemperatureC) OVER
    (
        PARTITION BY MachineCode
        ORDER BY ReadingTime, ReadingID
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS LastTemperatureC
FROM dbo.MachineReadings
ORDER BY MachineCode, ReadingTime, ReadingID;
