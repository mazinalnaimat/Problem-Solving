USE WindowFunctionsTrainingDB;
GO

-- Write your solution below.

WITH RunningStats AS
(
    select
          UtilityReadingID,
          BuildingName,
          MeterType,
          ReadingDate,
          Cost,
          AVG(Cost)
          OVER
          (
            partition by BuildingName, MeterType
            order by ReadingDate, UtilityReadingID
          )AS RunnningAvgCostPerBuildMeterType,
          STDEVP(Cost)
          OVER
          (
            partition by BuildingName, MeterType
            order by ReadingDate, UtilityReadingID
          )AS RunnningCostPerBuildMeterTypePopStdDev
    from UtilityReadings
     where Cost is not null
)

Select * from RunningStats
where RunnningCostPerBuildMeterTypePopStdDev is not null
      AND ABS(Cost - RunnningAvgCostPerBuildMeterType) > RunnningCostPerBuildMeterTypePopStdDev
order by  BuildingName, MeterType, ReadingDate, UtilityReadingID


