# Challenge 2: Show running SUM of sales amount for each salesperson by order date.

## Function

`SUM`

## Type

Challenge solution

## Idea

Calculates totals across a window without collapsing rows.

## What to notice

- `PARTITION BY` restarts the calculation for each group.
- `ORDER BY` controls row order inside the window when the function needs ordering.
- Window functions keep the original rows; they do not collapse rows like normal `GROUP BY`.

## SQL file

Open `Solution.sql` and run it after the setup script.
