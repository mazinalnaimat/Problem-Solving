# Challenge 3: Create row numbers for employees ordered by PerformanceScore descending.

## Function

`ROW_NUMBER`

## Type

Challenge solution

## Idea

Gives a unique sequential number to each row inside an ordered window.

Remember: `ROW_NUMBER` always gives a unique number, even when values are tied. Add a tie-breaker column to make the order stable.

## What to notice

- `PARTITION BY` restarts the calculation for each group.
- `ORDER BY` controls row order inside the window when the function needs ordering.
- Window functions keep the original rows; they do not collapse rows like normal `GROUP BY`.

## SQL file

Open `Solution.sql` and run it after the setup script.
