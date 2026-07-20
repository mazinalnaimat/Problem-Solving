USE WindowFunctionsTrainingDB;
GO

WITH ReadingCounts AS
(
    SELECT
        ReadingID,
        MachineCode,
        ReadingTime,
        COUNT(*) OVER
        (
            PARTITION BY MachineCode
        ) AS MachineReadingCount
    FROM dbo.MachineReadings
)
SELECT
    ReadingID,
    MachineCode,
    ReadingTime,
    MachineReadingCount
FROM ReadingCounts
WHERE MachineReadingCount >= 3
ORDER BY MachineCode, ReadingTime, ReadingID;
