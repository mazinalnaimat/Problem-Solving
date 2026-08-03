# Challenge 1: One alphabetic list of all distinct machine codes

## Required result

- Return exactly one row.
- Remove duplicate machine codes before aggregation.
- Join values with a comma and one space.
- Order machine codes alphabetically inside the string.

## Table(s)

- `dbo.MachineReadings`

## Columns to show

- `AllMachineCodes`

## Skills practiced

- Global `STRING_AGG` without `GROUP BY`
- Distinct preprocessing with a CTE

## Important

- Keep the source detail rows unless the challenge explicitly asks for grouped rows.
- The final `ORDER BY` controls display order; an `ORDER BY` inside `OVER()` controls the calculation order.
- Write your answer in `MySol.sql` before checking `Solution.sql`.
