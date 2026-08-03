USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    MachineCode,
    ReadingTime,
    VibrationMmS,
    MIN(VibrationMmS) OVER
    (
        PARTITION BY MachineCode
        ORDER BY ReadingTime, ReadingID
        ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
    ) AS TwoReadingMinimumVibration
FROM dbo.MachineReadings
ORDER BY MachineCode, ReadingTime, ReadingID;
