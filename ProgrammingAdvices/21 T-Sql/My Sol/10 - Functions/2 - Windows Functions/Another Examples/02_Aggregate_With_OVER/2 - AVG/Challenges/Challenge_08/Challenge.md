# Challenge 8: AVG challenge 8: running utility readings by building and meter

## Required result

Return `UtilityReadingID`, `BuildingName`, `MeterType`, `ReadingDate`, `Consumption`, and `RunningAverageConsumption` from `dbo.UtilityReadings`, with `RunningAverageConsumption` showing the average of `Consumption` for rows that have the same `BuildingName` and `MeterType`.
Calculate `RunningAverageConsumption` as a running value after ordering each calculation group by `ReadingDate` and `UtilityReadingID` in ascending order, starting with the first row and ending at the current row.
Sort the final result by `BuildingName`, `MeterType`, `ReadingDate`, and `UtilityReadingID` in ascending order.

## Table(s)

- `dbo.UtilityReadings`

## Columns to show

- `UtilityReadingID`
- `BuildingName`
- `MeterType`
- `ReadingDate`
- `Consumption`
- `RunningAverageConsumption`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
