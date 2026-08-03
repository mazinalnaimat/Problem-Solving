# COUNT salary value per department while keeping employee rows

## Function

`COUNT`

## Type

Worked example

## Idea

Counts rows or values across a window without collapsing rows.

## What to notice

- `PARTITION BY` restarts the calculation for each group.
- `ORDER BY` controls row order inside the window when the function needs ordering.
- Window functions keep the original rows; they do not collapse rows like normal `GROUP BY`.

## SQL file

Open `Solution.sql` and run it after the setup script.
