USE WindowFunctionsTrainingDB;
GO

WITH DailyValues AS
(
    SELECT
        ProductionLine,
        CAST(ReadingTime AS date) AS ReadingDate,
        AVG(VibrationMmS) AS DailyAverageVibrationMmS
    FROM dbo.MachineReadings
    WHERE VibrationMmS IS NOT NULL
    GROUP BY ProductionLine, CAST(ReadingTime AS date)
)
SELECT
    ProductionLine,
    ReadingDate,
    DailyAverageVibrationMmS,
    VARP(DailyAverageVibrationMmS) OVER
    (
        PARTITION BY ProductionLine
        ORDER BY ReadingDate
    ) AS RunningDailyDailyVibrationPopulationVariance
FROM DailyValues
ORDER BY ProductionLine, ReadingDate;
