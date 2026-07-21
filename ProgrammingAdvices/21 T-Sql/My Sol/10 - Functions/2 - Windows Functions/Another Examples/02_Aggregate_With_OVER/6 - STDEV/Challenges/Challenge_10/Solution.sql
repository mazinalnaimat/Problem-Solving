USE WindowFunctionsTrainingDB;
GO

WITH FullGroupStats AS
(
    SELECT
        ProductionLine,
        STDEV(CAST(OutputUnits AS decimal(10,2))) AS FullGroupOutputSampleDeviation
    FROM dbo.MachineReadings
    WHERE OutputUnits IS NOT NULL
    GROUP BY ProductionLine
)
SELECT
    d.ReadingID,
    d.ProductionLine,
    d.ReadingTime,
    d.OutputUnits,
    g.FullGroupOutputSampleDeviation,
    STDEV(CAST(d.OutputUnits AS decimal(10,2))) OVER
    (
        PARTITION BY d.ProductionLine
        ORDER BY d.ReadingTime, d.ReadingID
    ) AS RunningOutputSampleDeviation
FROM dbo.MachineReadings AS d
INNER JOIN FullGroupStats AS g
    ON g.ProductionLine = d.ProductionLine
WHERE d.OutputUnits IS NOT NULL
ORDER BY d.ProductionLine, d.ReadingTime, d.ReadingID;
