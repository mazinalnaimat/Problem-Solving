USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    MachineCode,
    ReadingTime,
    DefectCount,
    MAX(DefectCount) OVER
    (
        PARTITION BY MachineCode
        ORDER BY ReadingTime, ReadingID
        ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
    ) AS TwoReadingMaximumDefects
FROM dbo.MachineReadings
ORDER BY MachineCode, ReadingTime, ReadingID;
