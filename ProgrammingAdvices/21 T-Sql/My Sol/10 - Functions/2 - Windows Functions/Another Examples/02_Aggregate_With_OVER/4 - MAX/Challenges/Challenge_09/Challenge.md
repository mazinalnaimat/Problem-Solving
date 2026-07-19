# Challenge 9: MAX challenge 9: current and previous machine reading

## Required result

Return `ReadingID`, `MachineCode`, `ReadingTime`, `DefectCount`, and `TwoReadingMaximumDefects` from `dbo.MachineReadings`, with `TwoReadingMaximumDefects` showing the highest value of `DefectCount` for rows that have the same `MachineCode`.
Order each calculation group by `ReadingTime` and `ReadingID` in ascending order, and calculate `TwoReadingMaximumDefects` from the current row and the immediately previous row when it exists.
Sort the final result by `MachineCode`, `ReadingTime`, and `ReadingID` in ascending order.

## Table(s)

- `dbo.MachineReadings`

## Columns to show

- `ReadingID`
- `MachineCode`
- `ReadingTime`
- `DefectCount`
- `TwoReadingMaximumDefects`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
