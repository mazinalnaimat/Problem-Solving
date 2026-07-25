USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    ReadingTime,
    DefectCount,
    VARP(CAST(DefectCount AS decimal(10,2))) OVER
    (
        ORDER BY ReadingTime, ReadingID
    ) AS OverallRunningDefectPopulationVariance
FROM dbo.MachineReadings
WHERE DefectCount IS NOT NULL
ORDER BY ReadingTime, ReadingID;
