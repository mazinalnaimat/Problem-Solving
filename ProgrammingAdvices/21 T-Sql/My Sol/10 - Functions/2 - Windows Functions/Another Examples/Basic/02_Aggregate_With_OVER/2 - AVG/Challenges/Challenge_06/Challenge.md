# Challenge 6: AVG challenge 6: current and next two race results

## Required result

Return `ResultID`, `AthleteName`, `TeamName`, `RaceDate`, `EventName`, `FinishSeconds`, and `NextThreeAverageFinish` from `dbo.RaceResults`, with `NextThreeAverageFinish` showing the average of `FinishSeconds` for rows that have the same `AthleteName`.
Order each calculation group by `RaceDate` and `ResultID` in ascending order, and calculate `NextThreeAverageFinish` from the current row and the next two rows when they exist.
Sort the final result by `AthleteName`, `RaceDate`, and `ResultID` in ascending order.

## Table(s)

- `dbo.RaceResults`

## Columns to show

- `ResultID`
- `AthleteName`
- `TeamName`
- `RaceDate`
- `EventName`
- `FinishSeconds`
- `NextThreeAverageFinish`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
