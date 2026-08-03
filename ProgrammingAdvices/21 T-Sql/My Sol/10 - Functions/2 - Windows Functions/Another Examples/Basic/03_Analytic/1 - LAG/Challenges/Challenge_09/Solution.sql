USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    MachineCode,
    ReadingTime,
    DefectCount,
    LAG(DefectCount, 2, 0) OVER
    (
        PARTITION BY MachineCode
        ORDER BY ReadingTime, ReadingID
    ) AS PreviousDefectCount
FROM dbo.MachineReadings
ORDER BY MachineCode, ReadingTime, ReadingID;
