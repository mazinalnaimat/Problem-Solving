USE WindowFunctionsTrainingDB;
GO

WITH DailyValues AS
(
    SELECT
        ProductionLine,
        CAST(ReadingTime AS date) AS ReadingDate,
        AVG(CAST(DefectCount AS decimal(10,2))) AS DailyAverageDefectCount
    FROM dbo.MachineReadings
    WHERE DefectCount IS NOT NULL
    GROUP BY ProductionLine, CAST(ReadingTime AS date)
)
SELECT
    ProductionLine,
    ReadingDate,
    DailyAverageDefectCount,
    STDEV(DailyAverageDefectCount) OVER
    (
        PARTITION BY ProductionLine
        ORDER BY ReadingDate
    ) AS RunningDailyDailyDefectSampleDeviation
FROM DailyValues
ORDER BY ProductionLine, ReadingDate;
