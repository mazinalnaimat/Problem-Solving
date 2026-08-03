USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    MachineCode,
    ProductionLine,
    CHECKSUM_AGG(ReadingID) OVER
    (
        PARTITION BY ProductionLine
    ) AS LineReadingIDChecksum
FROM dbo.MachineReadings
ORDER BY ProductionLine, ReadingID;
