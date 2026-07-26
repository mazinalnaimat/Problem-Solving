USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    MachineCode,
    ReadingTime,
    CHECKSUM_AGG(ReadingID) OVER () AS AllReadingIDChecksum
FROM dbo.MachineReadings
ORDER BY ReadingTime, ReadingID;
