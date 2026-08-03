# Median salary per department

## Function

`PERCENTILE_CONT`

## Type

Worked example

## Idea

Returns a continuous percentile value, interpolating when needed.

## What to notice

- `PARTITION BY` restarts the calculation for each group.
- `ORDER BY` controls row order inside the window when the function needs ordering.
- Window functions keep the original rows; they do not collapse rows like normal `GROUP BY`.

## SQL file

Open `Solution.sql` and run it after the setup script.
