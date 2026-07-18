# Challenge 5: SUM

## Required result

Return `ProjectName`, `TaskTitle`, `EstimatedHours`, and `SUM_HoursInProject` from `dbo.Tasks`, with `SUM_HoursInProject` showing the total of `EstimatedHours` for rows that have the same `ProjectName`.
Sort the final result by `ProjectName` and `TaskTitle` in ascending order.

## Table(s)

- `dbo.Tasks`

## Columns to show

- `ProjectName`
- `TaskTitle`
- `EstimatedHours`
- `SUM_HoursInProject`

## Important

- Keep the source detail rows; the calculated value must appear beside each required row.
- Write your solution in `MySol.sql` before checking `Solution.sql`.
