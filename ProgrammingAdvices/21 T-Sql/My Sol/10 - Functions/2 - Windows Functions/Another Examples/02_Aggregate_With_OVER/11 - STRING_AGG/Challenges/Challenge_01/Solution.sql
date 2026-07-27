USE WindowFunctionsTrainingDB;
GO

WITH DistinctMachines AS
(
    SELECT DISTINCT MachineCode
    FROM dbo.MachineReadings
)
SELECT
    STRING_AGG(CONVERT(nvarchar(max), MachineCode), ', ')
        WITHIN GROUP (ORDER BY MachineCode) AS AllMachineCodes
FROM DistinctMachines;
