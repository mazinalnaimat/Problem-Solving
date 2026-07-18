# Split students into 3 score groups per class

## Function

`NTILE`

## Type

Worked example

## Idea

Divides ordered rows into a requested number of nearly equal groups.

## What to notice

- `PARTITION BY` restarts the calculation for each group.
- `ORDER BY` controls row order inside the window when the function needs ordering.
- Window functions keep the original rows; they do not collapse rows like normal `GROUP BY`.

## SQL file

Open `Solution.sql` and run it after the setup script.
