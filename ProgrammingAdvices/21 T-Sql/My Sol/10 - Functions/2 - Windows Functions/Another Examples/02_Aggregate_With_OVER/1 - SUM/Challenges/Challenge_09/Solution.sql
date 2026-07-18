USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    MachineCode,
    ReadingTime,
    OutputUnits,
    SUM(OutputUnits) OVER
    (
        PARTITION BY MachineCode
        ORDER BY ReadingTime, ReadingID
        ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
    ) AS TwoReadingOutput
FROM dbo.MachineReadings
ORDER BY MachineCode, ReadingTime, ReadingID;
