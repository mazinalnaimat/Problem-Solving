USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    ProductionLine,
    MachineCode,
    DefectCount,
    CUME_DIST() OVER
    (
        PARTITION BY ProductionLine
        ORDER BY DefectCount
    ) AS DistributionValue
FROM dbo.MachineReadings
WHERE DefectCount IS NOT NULL
ORDER BY ProductionLine, DefectCount;
