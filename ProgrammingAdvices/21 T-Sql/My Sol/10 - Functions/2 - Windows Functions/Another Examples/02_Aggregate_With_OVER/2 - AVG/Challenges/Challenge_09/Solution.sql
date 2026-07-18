USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    MachineCode,
    ReadingTime,
    VibrationMmS,
    AVG(VibrationMmS) OVER
    (
        PARTITION BY MachineCode
        ORDER BY ReadingTime, ReadingID
        ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
    ) AS TwoReadingAverageVibration
FROM dbo.MachineReadings
ORDER BY MachineCode, ReadingTime, ReadingID;
