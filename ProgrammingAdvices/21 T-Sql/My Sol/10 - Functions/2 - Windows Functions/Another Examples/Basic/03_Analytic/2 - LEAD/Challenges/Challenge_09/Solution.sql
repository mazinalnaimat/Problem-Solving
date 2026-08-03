USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    MachineCode,
    ReadingTime,
    DefectCount,
    LEAD(DefectCount, 2, 0) OVER
    (
        PARTITION BY MachineCode
        ORDER BY ReadingTime, ReadingID
    ) AS NextDefectCount
FROM dbo.MachineReadings
ORDER BY MachineCode, ReadingTime, ReadingID;
