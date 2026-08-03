USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    ProductionLine,
    MachineCode,
    DefectCount,
    PERCENT_RANK() OVER
    (
        PARTITION BY ProductionLine
        ORDER BY DefectCount
    ) AS DistributionValue
FROM dbo.MachineReadings
WHERE DefectCount IS NOT NULL
ORDER BY ProductionLine, DefectCount;
