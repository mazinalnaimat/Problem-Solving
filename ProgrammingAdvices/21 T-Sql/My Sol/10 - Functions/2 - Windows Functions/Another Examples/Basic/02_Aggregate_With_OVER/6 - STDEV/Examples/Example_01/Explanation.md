# STDEV salary value per department while keeping employee rows

## Function

`STDEV`

## Type

Worked example

## Idea

Returns sample standard deviation across a window.

This uses the sample version of the statistic. Use the `P` version (`STDEVP`, `VARP`) when treating the rows as the whole population.

## What to notice

- `PARTITION BY` restarts the calculation for each group.
- `ORDER BY` controls row order inside the window when the function needs ordering.
- Window functions keep the original rows; they do not collapse rows like normal `GROUP BY`.

## SQL file

Open `Solution.sql` and run it after the setup script.
