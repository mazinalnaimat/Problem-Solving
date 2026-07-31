USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    MachineCode,
    ProductionLine,
    OutputUnits,
    LAST_VALUE(OutputUnits) OVER
    (
        PARTITION BY ProductionLine
        ORDER BY OutputUnits DESC, ReadingID
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS LastOutputUnits
FROM dbo.MachineReadings
ORDER BY ProductionLine, OutputUnits DESC, ReadingID;
