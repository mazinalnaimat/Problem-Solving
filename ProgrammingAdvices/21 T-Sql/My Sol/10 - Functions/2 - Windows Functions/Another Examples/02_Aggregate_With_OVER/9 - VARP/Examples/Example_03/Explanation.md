# VARP student scores per class

## Function

`VARP`

## Type

Worked example

## Idea

Returns population variance across a window.

This uses the population version of the statistic. Use the non-`P` version (`STDEV`, `VAR`) when treating rows as a sample.

## What to notice

- `PARTITION BY` restarts the calculation for each group.
- `ORDER BY` controls row order inside the window when the function needs ordering.
- Window functions keep the original rows; they do not collapse rows like normal `GROUP BY`.

## SQL file

Open `Solution.sql` and run it after the setup script.
