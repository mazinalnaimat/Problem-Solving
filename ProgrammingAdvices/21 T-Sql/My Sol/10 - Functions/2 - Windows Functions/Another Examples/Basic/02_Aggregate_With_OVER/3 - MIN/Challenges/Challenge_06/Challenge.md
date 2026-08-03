# Challenge 6: MIN challenge 6: current and next two race results

## Required result

Return `ResultID`, `AthleteName`, `TeamName`, `RaceDate`, `EventName`, `FinishSeconds`, and `NextThreeFastestTime` from `dbo.RaceResults`, with `NextThreeFastestTime` showing the lowest value of `FinishSeconds` for rows that have the same `AthleteName`.
Order each calculation group by `RaceDate` and `ResultID` in ascending order, and calculate `NextThreeFastestTime` from the current row and the next two rows when they exist.
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
- `NextThreeFastestTime`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
