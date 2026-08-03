# Challenge 6: Centered three-result race window

## Required result

- For each event, count the previous row, current row, and next row.
- Rows at the start or end of an event may have a count smaller than three.
- Sort by `EventName`, `RaceDate`, and `ResultID`.

## Table(s)

- `dbo.RaceResults`

## Columns to show

- `ResultID`
- `EventName`
- `AthleteName`
- `RaceDate`
- `CenteredResultCount`

## Skills practiced

- A centered window frame
- Using both `PRECEDING` and `FOLLOWING`

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
