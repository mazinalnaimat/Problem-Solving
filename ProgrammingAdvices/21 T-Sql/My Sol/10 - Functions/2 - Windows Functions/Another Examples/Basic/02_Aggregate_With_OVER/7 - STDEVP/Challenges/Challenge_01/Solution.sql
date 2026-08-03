USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    ReadingTime,
    VibrationMmS,
    STDEVP(VibrationMmS) OVER
    (
        ORDER BY ReadingTime, ReadingID
    ) AS OverallRunningVibrationPopulationDeviation
FROM dbo.MachineReadings
WHERE VibrationMmS IS NOT NULL
ORDER BY ReadingTime, ReadingID;
