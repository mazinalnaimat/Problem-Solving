USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    MachineCode,
    ProductionLine,
    ReadingTime,
    COUNT(*) OVER () AS AllReadingCount
FROM dbo.MachineReadings
ORDER BY ReadingTime, ReadingID;
