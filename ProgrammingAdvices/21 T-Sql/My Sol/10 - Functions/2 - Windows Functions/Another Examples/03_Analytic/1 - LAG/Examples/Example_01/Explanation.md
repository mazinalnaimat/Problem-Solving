# Previous salary by hire date inside department

## Function

`LAG`

## Type

Worked example

## Idea

Reads a value from a previous row in the same ordered window.

## What to notice

- `PARTITION BY` restarts the calculation for each group.
- `ORDER BY` controls row order inside the window when the function needs ordering.
- Window functions keep the original rows; they do not collapse rows like normal `GROUP BY`.

## SQL file

Open `Solution.sql` and run it after the setup script.
