# First hired salary in each department

## Function

`FIRST_VALUE`

## Type

Worked example

## Idea

Returns the first value in the ordered window.

## What to notice

- `PARTITION BY` restarts the calculation for each group.
- `ORDER BY` controls row order inside the window when the function needs ordering.
- Window functions keep the original rows; they do not collapse rows like normal `GROUP BY`.

## SQL file

Open `Solution.sql` and run it after the setup script.
