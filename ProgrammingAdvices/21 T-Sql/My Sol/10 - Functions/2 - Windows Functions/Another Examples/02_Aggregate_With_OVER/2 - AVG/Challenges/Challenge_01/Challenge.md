# Challenge 1: AVG challenge 1: machine readings by production line

## Required result

Return `ReadingID`, `MachineCode`, `ProductionLine`, `ReadingTime`, `TemperatureC`, and `LineAverageTemperature` from `dbo.MachineReadings`, with `LineAverageTemperature` showing the average of `TemperatureC` for rows that have the same `ProductionLine`.
Sort the final result by `ProductionLine` in ascending order.

## Table(s)

- `dbo.MachineReadings`

## Columns to show

- `ReadingID`
- `MachineCode`
- `ProductionLine`
- `ReadingTime`
- `TemperatureC`
- `LineAverageTemperature`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
