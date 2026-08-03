# Challenge 9: SUM challenge 9: current and previous machine reading

## Required result

Return `ReadingID`, `MachineCode`, `ReadingTime`, `OutputUnits`, and `TwoReadingOutput` from `dbo.MachineReadings`, with `TwoReadingOutput` showing the total of `OutputUnits` for rows that have the same `MachineCode`.
Order each calculation group by `ReadingTime` and `ReadingID` in ascending order, and calculate `TwoReadingOutput` from the current row and the immediately previous row when it exists.
Sort the final result by `MachineCode`, `ReadingTime`, and `ReadingID` in ascending order.

## Table(s)

- `dbo.MachineReadings`

## Columns to show

- `ReadingID`
- `MachineCode`
- `ReadingTime`
- `OutputUnits`
- `TwoReadingOutput`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
