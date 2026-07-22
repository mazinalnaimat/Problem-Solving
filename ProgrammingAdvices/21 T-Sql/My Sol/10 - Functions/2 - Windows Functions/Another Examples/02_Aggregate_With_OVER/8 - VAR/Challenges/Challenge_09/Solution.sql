USE WindowFunctionsTrainingDB;
GO

WITH DailyValues AS
(
    SELECT
        ProductionLine,
        CAST(ReadingTime AS date) AS ReadingDate,
        AVG(TemperatureC) AS DailyAverageTemperatureC
    FROM dbo.MachineReadings
    WHERE TemperatureC IS NOT NULL
    GROUP BY ProductionLine, CAST(ReadingTime AS date)
)
SELECT
    ProductionLine,
    ReadingDate,
    DailyAverageTemperatureC,
    VAR(DailyAverageTemperatureC) OVER
    (
        PARTITION BY ProductionLine
        ORDER BY ReadingDate
    ) AS RunningDailyDailyTemperatureSampleVariance
FROM DailyValues
ORDER BY ProductionLine, ReadingDate;
