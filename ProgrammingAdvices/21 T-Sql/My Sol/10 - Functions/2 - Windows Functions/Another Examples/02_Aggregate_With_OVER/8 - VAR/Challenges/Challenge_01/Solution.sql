USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    ReadingTime,
    OutputUnits,
    VAR(CAST(OutputUnits AS decimal(10,2))) OVER
    (
        ORDER BY ReadingTime, ReadingID
    ) AS OverallRunningOutputSampleVariance
FROM dbo.MachineReadings
WHERE OutputUnits IS NOT NULL
ORDER BY ReadingTime, ReadingID;
