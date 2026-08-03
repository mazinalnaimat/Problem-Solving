# Challenge 6: SUM challenge 6: current and next two race results

## Required result

Return `ResultID`, `AthleteName`, `TeamName`, `RaceDate`, `EventName`, `Points`, and `NextThreeRacePoints` from `dbo.RaceResults`, with `NextThreeRacePoints` showing the total of `Points` for rows that have the same `AthleteName`.
Order each calculation group by `RaceDate` and `ResultID` in ascending order, and calculate `NextThreeRacePoints` from the current row and the next two rows when they exist.
Sort the final result by `AthleteName`, `RaceDate`, and `ResultID` in ascending order.

## Table(s)

- `dbo.RaceResults`

## Columns to show

- `ResultID`
- `AthleteName`
- `TeamName`
- `RaceDate`
- `EventName`
- `Points`
- `NextThreeRacePoints`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
