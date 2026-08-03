# List students per class

## Function

`STRING_AGG`

## Type

Worked example

## Idea

Concatenates strings across a group. In SQL Server, it is not used with OVER().

Important: in SQL Server, `STRING_AGG` is not used with `OVER()`. Use it with `GROUP BY` to concatenate values per group.

## What to notice

- `PARTITION BY` restarts the calculation for each group.
- `ORDER BY` controls row order inside the window when the function needs ordering.
- Window functions keep the original rows; they do not collapse rows like normal `GROUP BY`.

## SQL file

Open `Solution.sql` and run it after the setup script.
