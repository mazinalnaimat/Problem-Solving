USE WindowFunctionsTrainingDB;
GO

SELECT
    ReadingID,
    MachineCode,
    ProductionLine,
    OutputUnits,
    FIRST_VALUE(OutputUnits) OVER
    (
        PARTITION BY ProductionLine
        ORDER BY OutputUnits DESC, ReadingID
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS FirstOutputUnits
FROM dbo.MachineReadings
ORDER BY ProductionLine, OutputUnits DESC, ReadingID;
