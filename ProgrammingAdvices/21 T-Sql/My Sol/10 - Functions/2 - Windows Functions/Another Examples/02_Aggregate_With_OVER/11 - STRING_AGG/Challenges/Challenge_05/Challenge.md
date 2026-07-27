# Challenge 5: Race leaderboard text ordered by finish time

## Required result

- Return one row per event.
- Format each item as `AthleteName - FinishSeconds sec`.
- Order items from the smallest finish time to the largest.
- Separate entries with ` | `.

## Table(s)

- `dbo.RaceResults`

## Columns to show

- `EventName`
- `Leaderboard`

## Skills practiced

- Ordering concatenated items by a numeric column
- Formatting leaderboard entries

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
