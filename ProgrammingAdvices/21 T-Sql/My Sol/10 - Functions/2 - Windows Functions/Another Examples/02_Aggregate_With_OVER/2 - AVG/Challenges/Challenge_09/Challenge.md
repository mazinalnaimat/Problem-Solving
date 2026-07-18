# Challenge 9: AVG challenge 9: current and previous machine reading

## Required result

Return `ReadingID`, `MachineCode`, `ReadingTime`, `VibrationMmS`, and `TwoReadingAverageVibration` from `dbo.MachineReadings`, with `TwoReadingAverageVibration` showing the average of `VibrationMmS` for rows that have the same `MachineCode`.
Order each calculation group by `ReadingTime` and `ReadingID` in ascending order, and calculate `TwoReadingAverageVibration` from the current row and the immediately previous row when it exists.
Sort the final result by `MachineCode`, `ReadingTime`, and `ReadingID` in ascending order.

## Table(s)

- `dbo.MachineReadings`

## Columns to show

- `ReadingID`
- `ReadingTime`
- `VibrationMmS`
- `TwoReadingAverageVibration`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
