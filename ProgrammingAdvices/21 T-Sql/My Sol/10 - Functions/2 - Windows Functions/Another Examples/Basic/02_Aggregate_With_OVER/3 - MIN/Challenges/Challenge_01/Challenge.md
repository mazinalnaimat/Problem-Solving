# Challenge 1: MIN challenge 1: machine readings by production line

## Required result

Return `ReadingID`, `MachineCode`, `ProductionLine`, `ReadingTime`, `TemperatureC`, and `LineMinimumTemperature` from `dbo.MachineReadings`, with `LineMinimumTemperature` showing the lowest value of `TemperatureC` for rows that have the same `ProductionLine`.
Sort the final result by `ProductionLine` in ascending order.

## Table(s)

- `dbo.MachineReadings`

## Columns to show

- `ReadingID`
- `MachineCode`
- `ProductionLine`
- `ReadingTime`
- `TemperatureC`
- `LineMinimumTemperature`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
