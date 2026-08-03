USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    ProductionLine,
    OutputUnits,
    PERCENTILE_DISC(0.70) WITHIN GROUP (ORDER BY OutputUnits)
        OVER (PARTITION BY ProductionLine) AS PercentileValue
FROM dbo.MachineReadings
WHERE OutputUnits IS NOT NULL
ORDER BY ProductionLine, OutputUnits;
