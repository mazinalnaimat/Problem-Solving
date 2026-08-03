# Last hired salary in each department

## Function

`LAST_VALUE`

## Type

Worked example

## Idea

Returns the last value in the ordered window. Usually needs an explicit frame.

Important: `LAST_VALUE` often needs `ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING`; otherwise SQL Server may return the current row's value because of the default frame.

## What to notice

- `PARTITION BY` restarts the calculation for each group.
- `ORDER BY` controls row order inside the window when the function needs ordering.
- Window functions keep the original rows; they do not collapse rows like normal `GROUP BY`.

## SQL file

Open `Solution.sql` and run it after the setup script.
