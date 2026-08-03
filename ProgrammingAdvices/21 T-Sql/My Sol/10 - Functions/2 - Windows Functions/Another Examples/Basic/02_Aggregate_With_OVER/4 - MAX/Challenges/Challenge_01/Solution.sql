USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    MachineCode,
    ProductionLine,
    ReadingTime,
    VibrationMmS,
    MAX(VibrationMmS) OVER
    (
        PARTITION BY ProductionLine
    ) AS LineMaximumVibration
FROM dbo.MachineReadings
ORDER BY ProductionLine;
